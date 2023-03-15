# Manage::Coreui4

Short description and motivation.

## 安装方法

### 以scope为"admin"为例

1. 添加以下内容到Gemfile

```ruby
gem "manage-coreui4"
gem "sassc-rails"
```

2. 运行以下命令

```bash
$ bundle
```

3. 创建 app/controllers/admin_controller.rb

```ruby

class AdminController < ApplicationController
  include ManageControllerConcern

  private

  def setup_config
    @config = {
      scope: 'admin',
      routes: [
      ]
    }
  end
end
```

4. 创建 app/controllers/admin/resources_controller.rb

```ruby

class Admin::ResourcesController < AdminController
  include ManageResourcesConcern
end
```

5. 创建 app/assets/stylesheets/admin.scss

```scss
@import "manage";
```

6. 创建 app/assets/javascripts/admin.js

```js
//= require manage
```

7. 用以下内容覆盖 app/assets/config/manifest.js

```js
//= link admin.js
//= link admin.css
```

8. 运行以下命令

```bash
rails manage_coreui4:copy_public
```

9. 添加以下内容至 app/helpers/application_helper.rb

```ruby
  include ManageHelper
```

## Contributing

Contribution directions go here.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
