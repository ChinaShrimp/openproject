#-- copyright
# OpenProject is a project management system.
# Copyright (C) 2012-2018 the OpenProject Foundation (OPF)
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version 3.
#
# OpenProject is a fork of ChiliProject, which is a fork of Redmine. The copyright follows:
# Copyright (C) 2006-2017 Jean-Philippe Lang
# Copyright (C) 2010-2013 the ChiliProject Team
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 2
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
#
# See docs/COPYRIGHT.rdoc for more details.
#++

module Redmine::MenuManager::TopMenuBim::ConstructModuleMenu
  def render_construct_module_top_menu_node
    return '' if User.current.anonymous? and Setting.login_required?

    render_construct_module_dropdown
  end

  private

  def render_construct_module_dropdown
    # label = !!(@project && !@project.name.empty?) ? @project.name : t(:label_select_project)
    label = "选择模块"
    render_menu_dropdown_with_items(
      label: label,
      label_options: { id: 'module-menu' },
      items: construct_module_items,
      options: {
        drop_down_class: 'drop-down--projects'
      }
    ) 
  end

  def construct_module_items
    [
      dashboard_module_item,
      progress_module_item,
      quanlity_module_item, 
      safety_module_item,
      cost_module_item,
    ]
  end

  def dashboard_module_item
    Redmine::MenuManager::MenuItem.new(
      :list_projects,
      { 
        controller: '/dashboard', action: 'index' 
      },
      caption: "首页",
      icon: "icon-show-all-projects icon4",
      html: {
        accesskey: OpenProject::AccessKeys.key_for(:project_search)
      }
    )
  end

  def progress_module_item
    Redmine::MenuManager::MenuItem.new(
      :list_projects,
      { 
        controller: '/progress', action: 'index' 
      },
      caption: "进度管理",
      icon: "icon-show-all-projects icon4",
      html: {
        accesskey: OpenProject::AccessKeys.key_for(:project_search)
      }
    )
  end

  def quanlity_module_item
    Redmine::MenuManager::MenuItem.new(
      :list_projects,
      { 
        controller: '/quality', action: 'index' 
      },
      caption: "质量管理",
      icon: "icon-show-all-projects icon4",
      html: {
        accesskey: OpenProject::AccessKeys.key_for(:project_search)
      }
    )
  end

  def safety_module_item
    Redmine::MenuManager::MenuItem.new(
      :list_projects,
      { 
        controller: '/safety', action: 'index' 
      },
      caption: "安全管理",
      icon: "icon-show-all-projects icon4",
      html: {
        accesskey: OpenProject::AccessKeys.key_for(:project_search)
      }
    )
  end

  def cost_module_item
    Redmine::MenuManager::MenuItem.new(
      :list_projects,
      { 
        controller: '/cost', action: 'index' 
      },
      caption: "成本管理",
      icon: "icon-show-all-projects icon4",
      html: {
        accesskey: OpenProject::AccessKeys.key_for(:project_search)
      }
    )
  end
end
