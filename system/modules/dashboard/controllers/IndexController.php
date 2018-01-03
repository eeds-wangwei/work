<?php

namespace application\modules\dashboard\controllers;

use application\core\model\Module;
use application\core\utils\Api;
use application\core\utils\Cache;
use application\core\utils\Convert;
use application\core\utils\Database;
use application\core\utils\Env;
use application\core\utils\File;
use application\core\utils\Ibos;
use application\core\utils\StringUtil;
use application\modules\main\model\Attachment;
use application\modules\main\model\Setting;
use application\modules\user\model\User;
use CHtml;

/**
 * 后台索引页文件
 *
 * @author banyanCheung <banyan@ibos.com.cn>
 * @link http://www.ibos.com.cn/
 * @copyright Copyright &copy; 2012-2013 IBOS Inc
 */

/**
 * 后台索引控制器
 *
 * @package application.modules.dashboard.controllers
 * @author banyanCheung <banyan@ibos.com.cn>
 * @version $Id$
 */
class IndexController extends BaseController
{

    const SECURITY_URL = 'http://www.ibos.com.cn/security.php';

    /**
     * 后台首页
     * @todo 附件统计
     * @todo 授权信息读取
     */
    public function actionIndex()
    {
        // 系统信息
        $systemInfo = Env::getSystemInfo();
        // 数据库大小
        $databaseSize = Database::getDatabaseSize();
        list($dataSize, $dataUnit) = explode(' ', $databaseSize);
        // 系统关闭
        $appClosed = Setting::model()->fetchSettingValueByKey('appclosed');
        // 新版本提示升级
        $newVersion = Ibos::app()->setting->get('newversion');
        // 安全信息获取URL
        $getSecurityUrl = Ibos::app()->urlManager->createUrl('dashboard/index/getsecurity');
        // 安装日期
        $mainModule = Module::model()->fetchByPk('main');
        // 授权信息
        $authkey = Ibos::app()->setting->get('config/security/authkey');
        $unit = Setting::model()->fetchSettingValueByKey('unit');
        $unitArray = StringUtil::utf8Unserialize($unit);
        if (isset($_GET['attachsize'])) {
            $attachSize = Attachment::model()->getTotalFilesize();
            $attachSize = is_numeric($attachSize) ? Convert::sizeCount($attachSize) : Ibos::lang('Unknow');
        } else {
            $attachSize = '';
        }
        $data = array(
            'unit' => $unitArray,
            'sys' => $systemInfo,
            'dataSize' => $dataSize,
            'dataUnit' => $dataUnit,
            'appClosed' => $appClosed,
            'newVersion' => $newVersion,
            'getSecurityUrl' => $getSecurityUrl,
            'installDate' => $mainModule['installdate'],
            'authkey' => $authkey,
            'attachSize' => $attachSize,
        );
        if (ENGINE == 'SAAS'){
            $class = 'application\core\engines\saas\CorpSaasDetail';
            if (class_exists($class)){
                $systemUrl = explode('.', str_replace('http://', '', $unitArray['systemurl']));
                $corpSaasDetail = new $class;
                $saasDetail = $corpSaasDetail->getSaasDetail($systemUrl[0]);
                $saasDetail['discount'] = $corpSaasDetail->getDiscount();
                $filesize = explode(' ', Convert::sizeCount($corpSaasDetail->getUsedSpace()));
                $saasDetail['usedSpace'] = array(
                    'size' => $filesize[0],
                    'unit' => $filesize[1],
                );
                $nowTime = strtotime(date('Y-m-d', time()));
                if ($saasDetail['expiretime'] >= $nowTime){
                    $saasDetail['restDay'] = ceil(($saasDetail['expiretime'] - $nowTime) / 86400);
                    $saasDetail['isBeyond'] = false;
                }else{
                    $saasDetail['restDay'] = ceil(($nowTime - $saasDetail['expiretime']) / 86400);
                    $saasDetail['isBeyond'] = true;
                }
                $expiretime = explode('-', date('Y-m-d', $saasDetail['expiretime']));
                $saasDetail['expiretime'] = array(
                    'year' => $expiretime[0],
                    'month' => $expiretime[1],
                    'day' => $expiretime[2],
                );
                $saasDetail['existUser'] = User::model()->count('status != 1');

                $saasLeft = array(
                    'user' => $saasDetail['alluser'] - $saasDetail['existUser'],
                    'space' => ($saasDetail['allspace'] * 1073741824) - $corpSaasDetail->getUsedSpace(),
                );
                $usedSpace = round($corpSaasDetail->getUsedSpace() / 1073741824 * 100) / 100;
                $saasDetail['precent'] = number_format($usedSpace / $saasDetail['allspace'], 2) * 100;
                // 用户数小于5 or 空间小于20MB
                if ($saasLeft['user'] < 5 || $saasLeft['space'] < 1048576 * 20) {
                    $saasDetail['upgradeTip'] = Ibos::lang('SAAS-user upgrade tip', '', array(
                        '{user}' => $saasLeft['user'],
                        '{space}' => Convert::sizeCount($saasLeft['space']),
                    ));
                }
                $data['saasDetail'] = $saasDetail;
            }
            $this->render('saas_index', $data);
        }else{
            $this->render('index', $data);
        }
    }

    /**
     * 添加订单接口
     */
    public function actionPay()
    {
        $numbers = Env::getRequest('numbers');
        $space = Env::getRequest('space');
        $month = Env::getRequest('month');
        $unit = Setting::model()->fetchSettingValueByKey('unit');
        $unitArray = StringUtil::utf8Unserialize($unit);
        $systemUrl = str_replace('http://', '', $unitArray['systemurl']);
        $corpCode = explode('.', $systemUrl);
        $uid = Ibos::app()->user->uid;
        $user = User::model()->fetchByUid($uid);
        $class = 'application\core\engines\saas\CorpSaasDetail';
        if (class_exists($class)){
            $corpSaasDetail = new $class;
            $result = $corpSaasDetail->pay($corpCode[0], $numbers, $space, $month, $unitArray['fullname'], $user['realname'], $user['mobile']);
            echo $result;
        }else{
            echo '';
        }
    }

    /**
     * 切换系统开关状态
     * @return void
     */
    public function actionSwitchstatus()
    {
        if (Ibos::app()->getRequest()->getIsAjaxRequest()) {
            $val = Env::getRequest('val');
            $result = Setting::model()->updateSettingValueByKey('appclosed', (int)$val);
            Cache::update(array('setting'));
            return $this->ajaxReturn(array('IsSuccess' => $result), 'json');
        }
    }

    /**
     * 获取远程服务器安全提示
     * @return void
     */
    public function actionGetSecurity()
    {
        if (Ibos::app()->getRequest()->getIsAjaxRequest()) {
            $return = File::fileSockOpen(self::SECURITY_URL, 0, 'charset=' . CHARSET);
            $this->ajaxReturn($return, 'EVAL');
        }
    }

    /**
     * 授权码写入文件
     */
    public function actionLicense()
    {
        if (Env::submitCheck('formhash')) {
            $licensekey = CHtml::encode(Env::getRequest('licensekey'));
            $filename = PATH_ROOT . '/data/licence.key';
            @file_put_contents($filename, $licensekey);
            $license = Ibos::app()->licence;
            $license->init();
            $licenseInfo = $license->getLicence();
            $iboscloud = Ibos::app()->setting->get('setting/iboscloud');
            $iboscloud['appid'] = isset($licenseInfo['appid']) ? $licenseInfo['appid'] : '';
            $iboscloud['secret'] = isset($licenseInfo['secret']) ? $licenseInfo['secret'] : '';
            Setting::model()->updateSettingValueByKey('iboscloud', serialize($iboscloud));
            Cache::update('setting');
            $this->success(Ibos::lang('Save succeed', 'message'));
        }
    }

}
