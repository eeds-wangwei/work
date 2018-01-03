<?php

namespace application\modules\mobile\controllers;

use application\core\model\Module;
use application\core\utils\Ibos;
use application\modules\role\utils\Role;

class AuthorityController extends BaseController
{

    public function actionIndex()
    {
        $email = Role::checkRouteAccess('email/list/index');
        $diary = Role::checkRouteAccess('diary/default/index');
        $calendar = Role::checkRouteAccess('calendar/schedule/index');
        $assignment = Role::checkRouteAccess('assignment/unfinished/index');
        $file = Role::checkRouteAccess('file/default/index');
        $thread = Role::checkRouteAccess('thread/list/index');
        $crm = Role::checkRouteAccess('crm/index/index') && Role::checkRouteAccess('crm/api/index');
        $workflow = Role::checkRouteAccess('workflow/list/index');

        $this->ajaxBaseReturn(true, array(
            'email' => $email,
            'diary' => $diary,
            'calendar' => $calendar,
            'assignment' => $assignment,
            'file' => $file,
            'thread' => $thread,
            'crm' => $crm,
            'workflow' => $workflow
        ));
    }

    public function actionInstall()
    {
        $module = Ibos::app()->db->createCommand()
            ->select('module')
            ->from(Module::model()->tableName())
            ->where("iscore = 0 AND disabled = 0")
            ->queryColumn();
        $this->ajaxBaseReturn(true, $module);
    }
}