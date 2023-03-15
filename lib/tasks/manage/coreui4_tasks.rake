# desc "Explaining what the task does"
# task :manage_coreui4 do
#   # Task goes here
# end

namespace :manage_coreui4 do
  task :copy_public => :"assets:environment" do
    source_file = File.join(Manage::Coreui4::Engine.root, 'public', 'manage')
    dest_file = File.join(Rails.root, 'public', 'manage')

    FileUtils.rm_rf(dest_file)
    FileUtils.copy_entry source_file, dest_file, true
  end
end