<?php

namespace application\modules\report\utils;

use application\core\utils\Ibos;
use application\modules\dashboard\model\Stamp;
use application\modules\message\utils\MessageApi;
use application\modules\report\model\Report;
use application\modules\user\model\User;
use application\modules\report\utils\Report as ReportUtil;

class ReportApi extends MessageApi
{

    private $_indexTab = array('reportPersonal', 'reportAppraise');

    /**
     * 提供给接口的模块首页配置方法
     * @return array
     */
    public function loadSetting()
    {
        $uid = Ibos::app()->user->uid;
        $subUidArr = User::model()->fetchSubUidByUid($uid);
        $subReportsCount = Report::model()->countReportByToid($uid);
        if (count($subUidArr) > 0 || $subReportsCount > 0) {
            return array(
                'name' => 'report/report',
                'title' => '工作汇报',
                'style' => 'in-report',
                'tab' => array(
                    array(
                        'name' => 'reportPersonal',
                        'title' => '个人',
                        'icon' => 'o-rp-personal'
                    ),
                    array(
                        'name' => 'reportAppraise',
                        'title' => '评阅',
                        'icon' => 'o-rp-appraise'
                    )
                )
            );
        } else {
            return array(
                'name' => 'report/report',
                'title' => '工作汇报',
                'style' => 'in-report',
                'tab' => array(
                    array(
                        'name' => 'reportPersonal',
                        'title' => '个人',
                        'icon' => 'o-rp-personal'
                    )
                )
            );
        }
    }

    /**
     * 渲染首页视图
     * @return type
     */
    public function renderIndex()
    {
        $return = array();
        $viewAlias = 'application.modules.report.views.indexapi.report';
        $uid = Ibos::app()->user->uid;
        // 自己的总结计划
        $reports = Report::model()->fetchAllRepByUids($uid);
        if (!empty($reports)) {
            $reports = $this->handleIconUrl($reports);
        }
        // 下属或者是某篇总结的汇报对象的总结计划
        $subUidArr = User::model()->fetchSubUidByUid($uid);
        $subUidStr = implode(',', $subUidArr);
        $subReports = Report::model()->fetchAll("FIND_IN_SET(`uid`, '{$subUidStr}') OR FIND_IN_SET({$uid}, `toid`) limit 0,4");
        if (!empty($subReports)) {
            $subReports = $this->handleIconUrl($subReports, true);
        }
        $data = array(
            'reports' => $reports,
            'subReports' => $subReports,
            'lang' => Ibos::getLangSource('report.default'),
            'assetUrl' => Ibos::app()->assetManager->getAssetsUrl('report')
        );
        foreach ($this->_indexTab as $tab) {
            $data['tab'] = $tab;
            if ($tab == 'reportPersonal') {
                $return[$tab] = Ibos::app()->getController()->renderPartial($viewAlias, $data, true);
            } else if ($tab == 'reportAppraise' && (count($subUidArr) > 0 || !empty($subReports))) {
                $return[$tab] = Ibos::app()->getController()->renderPartial($viewAlias, $data, true);
            }
        }
        return $return;
    }

    /**
     * 获取最新总结
     * @return integer
     */
    public function loadNew()
    {
        $uid = Ibos::app()->user->uid;
        //获取所有直属下属id
        $repids = Ibos::app()->db->createCommand()
            ->select('relateid')
            ->from('{{module_reader}}')
            ->where('module = :module AND uid = :uid', array(
                ':module' => 'report',
                ':uid' => $uid
            ))
            ->queryColumn();
        $repidStrs = "\"". implode('","', $repids). "\"";
        $count = Report::model()->count("repid NOT IN ({$repidStrs}) AND FIND_IN_SET({$uid}, `toid`)");
        return $count;
    }

    /**
     * 处理图章icon输出路径
     * @param array $reports 总结报告二维数组
     * @param boolean $returnUserInfo 是否要获得用户信息，用于评阅
     * @return 返回处理过图章icon后的数组
     */
    private function handleIconUrl($reports, $returnUserInfo = false)
    {
        foreach ($reports as $k => $report) {
            if ($returnUserInfo) {
                $reports[$k]['userInfo'] = User::model()->fetchByUid($report['uid']);
            }
            if ($report['stamp'] != 0) {
                $stamp = Stamp::model()->fetchIconById($report['stamp']);
                $reports[$k]['iconUrl'] = $stamp;
            } else {
                $reports[$k]['iconUrl'] = '';
            }
        }
        return $reports;
    }

}
