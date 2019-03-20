require 'redmine/menu_manager'

# 导航条右边头像菜单
Redmine::MenuManager.map :bim_account_menu do |menu|
  menu.push :my_page,
            { controller: '/me', action: 'page' },
            if: Proc.new { User.current.logged? }
  menu.push :my_account,
            { controller: '/me', action: 'account' },
            if: Proc.new { User.current.logged? }
  menu.push :administration,
            { controller: '/bim_admin', action: 'index' },
            if: Proc.new { User.current.admin? }
  menu.push :logout, :signout_path,
            if: Proc.new { User.current.logged? }
end

Redmine::MenuManager.map :bim_me_menu do |menu|
  menu_push = menu.push :account,
                        { controller: '/me', action: 'account' },
                        caption: :label_profile,
                        icon: 'icon2 icon-user'
  menu_push
  menu.push :settings,
            { controller: '/me', action: 'settings' },
            caption: :label_settings,
            icon: 'icon2 icon-settings2'
  menu.push :password,
            { controller: '/me', action: 'password' },
            caption: :button_change_password,
            if: Proc.new { User.current.change_password_allowed? },
            icon: 'icon2 icon-locked'

  menu.push :delete_account, :deletion_info_path,
            caption: I18n.t('account.delete'),
            param: :user_id,
            if: Proc.new { Setting.users_deletable_by_self? },
            last: :delete_account,
            icon: 'icon2 icon-delete'
end

Redmine::MenuManager.map :bim_admin_menu do |menu|
  menu.push :users,
            { controller: '/users' },
            caption: :label_user_plural,
            icon: 'icon2 icon-user'

  menu.push :groups,
            { controller: '/groups' },
            caption: :label_group_plural,
            icon: 'icon2 icon-group'
  menu.push :roles,
            { controller: '/roles' },
            caption: :label_role_and_permissions,
            icon: 'icon2 icon-settings'

  menu.push :announcements,
            { controller: '/announcements', action: 'edit' },
            caption: 'Announcement',
            icon: 'icon2 icon-news'

  menu.push :info,
            { controller: '/admin', action: 'info' },
            caption: :label_information_plural,
            last: true,
            icon: 'icon2 icon-info1'
end

Redmine::MenuManager.map :bim_progress_menu do |menu|
  menu.push :users,
            { controller: '/progress' },
            caption: :label_user_plural,
            icon: 'icon2 icon-user'

  menu.push :groups,
            { controller: '/groups' },
            caption: :label_group_plural,
            icon: 'icon2 icon-group'
  menu.push :roles,
            { controller: '/roles' },
            caption: :label_role_and_permissions,
            icon: 'icon2 icon-settings'

  menu.push :announcements,
            { controller: '/announcements', action: 'edit' },
            caption: 'Announcement',
            icon: 'icon2 icon-news'

  menu.push :info,
            { controller: '/admin', action: 'info' },
            caption: :label_information_plural,
            last: true,
            icon: 'icon2 icon-info1'
end
