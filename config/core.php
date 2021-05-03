<?php

return [

    /*
    |--------------------------------------------------------------------------
    | Core file for migration, table prefixed, validation length etc.
    |--------------------------------------------------------------------------
    |
    | File include table prefix for datatabase tables, model name and other details etc...
    |
    */

    'table_prefix' => env('TABLE_PREFIX'),

    'acl' => [
        'users_table' => env('TABLE_PREFIX').'_users',
        'clients_table' => env('TABLE_PREFIX').'_clients',
        'password_resets_table' => env('TABLE_PREFIX').'_password_resets',
        'roles_table' => env('TABLE_PREFIX').'_roles',
        'departments_table' => env('TABLE_PREFIX').'_departments',
        'departments_roles_table' => env('TABLE_PREFIX').'_departments_roles',
        'menu_table' => env('TABLE_PREFIX').'_menus',
        'department_role_menu_table' => env('TABLE_PREFIX').'_department_role_menu',
        'user_role_department' => env('TABLE_PREFIX').'_user_role_department',
        'translations_table' => env('TABLE_PREFIX').'_translations',
        'todos_table' =>  env('TABLE_PREFIX').'_todos',
        'announcements_table' => env('TABLE_PREFIX').'_announcements',
        'meetings' => env('TABLE_PREFIX').'_meetings',
        'meeting_members' => env('TABLE_PREFIX').'_meeting_members',
        'teams' => env('TABLE_PREFIX').'_teams',
        'teams_members' => env('TABLE_PREFIX').'_teams_members',
        'users_settings_table' => env('TABLE_PREFIX').'_user_settings',
        'dashboard_settings_table' => env('TABLE_PREFIX').'_dashboard_settings',
        'database_backups_table' => env('TABLE_PREFIX').'_database_backups',
        'holiday_table' => env('TABLE_PREFIX').'_holidays',
        'email_group_table' => env('TABLE_PREFIX').'_email_template_groups',
        'email_template_table' => env('TABLE_PREFIX').'_email_template',
        'user_activities_table' => env('TABLE_PREFIX').'_user_activities',
        'email_inbox_table' => env('TABLE_PREFIX').'_email_inbox',
        'inbox_attachment_table' => env('TABLE_PREFIX').'_email_inbox_attachment',
        'folder_table' => env('TABLE_PREFIX').'_folders',
        'files_table' => env('TABLE_PREFIX').'_files',
        'countries_table' => env('TABLE_PREFIX').'_countries',
        'languages_table' => env('TABLE_PREFIX').'_languages',
        'locales_table' => env('TABLE_PREFIX').'_locales',
        'currency' => env('TABLE_PREFIX').'_currency',
        'modules_table' => env('TABLE_PREFIX').'_modules',
        'form_table' => env('TABLE_PREFIX').'_form',
        'custom_fields' => env('TABLE_PREFIX').'_custom_fields',
        'timesheets_table' => env('TABLE_PREFIX').'_timesheets',
        'slack_table' => env('TABLE_PREFIX').'_slack_integration',
        'slack_settings_table' => env('TABLE_PREFIX').'_slack_settings',
        // PM
        'projects_table' => env('TABLE_PREFIX').'_projects',
        'project_user_table' => env('TABLE_PREFIX').'_project_user',
        'project_comments_table' => env('TABLE_PREFIX').'_project_comments',
        'project_attachments_table' => env('TABLE_PREFIX').'_project_attachments',
        'task_table' => env('TABLE_PREFIX').'_tasks',
        'task_user_table' => env('TABLE_PREFIX').'_task_user',
        'task_comments_table' => env('TABLE_PREFIX').'_task_comments',
        'task_attachments_table' => env('TABLE_PREFIX').'_task_attachments',
        'defects_table' => env('TABLE_PREFIX').'_defects',
        'defects_user_table' => env('TABLE_PREFIX').'_defect_user',
        'defect_comments_table' => env('TABLE_PREFIX').'_defect_comments',
        'defect_attachments_table' => env('TABLE_PREFIX').'_defect_attachments',
        'defects_history_table' => env('TABLE_PREFIX').'_defects_history',
        'incidents_table' => env('TABLE_PREFIX').'_incidents',
        'incident_user_table' => env('TABLE_PREFIX').'_incident_user',
        'incident_comments_table' => env('TABLE_PREFIX').'_incident_comments',
        'incident_attachments_table' => env('TABLE_PREFIX').'_incident_attachments',
        'incident_history_table' => env('TABLE_PREFIX').'_incident_history',
        'project_sprints_table' => env('TABLE_PREFIX').'_project_sprints',
        'project_sprint_members_table' => env('TABLE_PREFIX').'_project_sprint_members',
        'project_sprint_tasks_table' => env('TABLE_PREFIX').'_project_sprint_tasks',
        'project_sprint_task_members_table' => env('TABLE_PREFIX').'_project_sprint_task_members',
        'knowledge_base_category_table' => env('TABLE_PREFIX').'_knowledge_base_category',
        'knowledge_base_article_table' => env('TABLE_PREFIX') . '_knowledge_base_article',
        // CRM
        'providers_table' =>  env('TABLE_PREFIX').'_providers',
        'appointment_table' =>  env('TABLE_PREFIX').'_appointment',
        // HRM
        'leave_types_table' =>  env('TABLE_PREFIX').'_leave_types',
        'leaves_table' =>  env('TABLE_PREFIX').'_leaves',
        'leave_attachments_table' => env('TABLE_PREFIX').'_leave_attachments',
        // Sales
        'taxes_table' =>  env('TABLE_PREFIX').'_taxes',
        'items_table' =>  env('TABLE_PREFIX').'_items',
        'item_tax_table' =>  env('TABLE_PREFIX').'_item_tax',
        'estimate_settings_table' =>  env('TABLE_PREFIX').'_estimate_settings',
        'estimates_table' =>  env('TABLE_PREFIX').'_estimates',
        'estimate_items_table' =>  env('TABLE_PREFIX').'_estimate_items',
        'estimate_item_taxes_table' =>  env('TABLE_PREFIX').'_estimate_item_taxes',
        'invoice_settings_table' =>  env('TABLE_PREFIX').'_invoice_settings',
        'invoices_table' =>  env('TABLE_PREFIX').'_invoices',
        'invoice_items_table' =>  env('TABLE_PREFIX').'_invoice_items',
        'invoice_item_taxes_table' =>  env('TABLE_PREFIX').'_invoice_item_taxes',
        'payment_methods_table' =>  env('TABLE_PREFIX').'_payment_methods',
        'payment_gateway_settings_table' =>  env('TABLE_PREFIX').'_payment_gateway_settings',
        'payments_table' =>  env('TABLE_PREFIX').'_payments',

        /*
         * Models
         */
        'user' => Modules\User\Models\User\User::class,
        'clients_model' => Modules\Client\Models\Client::class,
        'role' => Modules\User\Models\Role\Role::class,
        'department' => Modules\User\Models\Department\Department::class,
        'announcement' => Modules\Announcement\Models\Announcement::class,
        'meeting_model' => Modules\Meeting\Models\Meeting::class,
        'team_model' => Modules\Team\Models\Team::class,
        'todo_model' => Modules\ToDo\Models\ToDo::class,
        'user_setting_model' => Modules\Setting\Models\Setting::class,
        'user_activity' => Modules\UserActivity\Models\UserActivity::class,
        'mailbox' => Modules\Mailbox\Models\Mailbox::class,
        'mailbox_attachment' => Modules\Mailbox\Models\MailboxAttachment::class,
        'file' => Modules\FileBrowser\Models\File::class,
        'file_browser' => Modules\FileBrowser\Models\FileBrowser::class,
        'email_template' => Modules\EmailTemplate\Models\EmailTemplate::class,
        'form' => Modules\CustomField\Models\Form::class,
        'custom_field' => Modules\CustomField\Models\CustomField::class,
        'timesheet_model' => Modules\Timesheet\Models\Timesheet::class,
        'slack_model' => Modules\Slack\Models\Slack::class,
        // PM
        'project_model' => Modules\Projects\Models\Project::class,
        'project_comment_model' => Modules\ProjectComment\Models\ProjectComment::class,
        'project_attachment_model' => Modules\ProjectAttachment\Models\ProjectAttachment::class,
        'task_model' => Modules\Task\Models\Task::class,
        'task_comment_model' => Modules\TaskComment\Models\TaskComment::class,
        'task_attachment_model' => Modules\TaskAttachment\Models\TaskAttachment::class,
        'defects_model' => Modules\Defect\Models\Defect::class,
        'defect_comment_model' => Modules\DefectComment\Models\DefectComment::class,
        'defect_attachment_model' => Modules\DefectAttachment\Models\DefectAttachment::class,
        'defects_history_model' => Modules\Defect\Models\DefectHistory::class,
        'incidents_model' => Modules\Incident\Models\Incident::class,
        'incident_comment_model' => Modules\IncidentComment\Models\IncidentComment::class,
        'incident_attachment_model' => Modules\IncidentAttachment\Models\IncidentAttachment::class,
        'incident_history_model' => Modules\Incident\Models\IncidentHistory::class,
        'project_planner_sprint_model' => Modules\ProjectPlannerSprint\Models\ProjectPlannerSprint::class,
        'project_planner_sprint_task_model' => Modules\ProjectSprintTask\Models\ProjectSprintTask::class,
        'knowledge_base_category_model' => Modules\KnowledgeBaseCategory\Models\KnowledgeBaseCategory::class,
        'knowledge_base_article_model' => Modules\KnowledgeBaseArticle\Models\KnowledgeBaseArticle::class,
        // CRM
        'appointment_model' =>  Modules\Appointments\Models\Appointment::class,
        'provider_model' =>  Modules\Provider\Models\Provider::class,
        // HRM
        'leave_type_model' => Modules\LeaveType\Models\LeaveType::class,
        'leave_model' => Modules\Leave\Models\Leave::class,
        'leave_attachment_model' => Modules\Leave\Models\LeaveAttachment::class,
        // Sales
        'tax_model' => Modules\Tax\Models\Tax::class,
        'estimate_item_model' => Modules\Estimate\Models\EstimateItem::class,
        'invoice_model' => Modules\Invoice\Models\Invoice::class,
        'invoice_item_model' => Modules\Invoice\Models\InvoiceItem::class,
        'payment_model' => Modules\Payment\Models\Payment::class,
    ],

    'EMAIL_ACTIVATION_EXPIRE' => 60 * 60 * 24 * 2,
    'FORGOT_PASSWORD_EXPIRE' => 60 * 1440,
    'COMPANY_NAME' => env('APP_NAME'),
    'support_mail_id' => env('SUPPORT_MAIL_ID',null),
    'max_length' => 255,
    'product_version' => 2.0,
];
