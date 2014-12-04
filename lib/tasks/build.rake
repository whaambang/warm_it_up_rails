desc "builds ember and puts it into public folder to prepare for deployment"
task :build => [:environment] do
  sh 'cd ../'
  sh 'cd warm_it_up_ember'
  sh 'ember build --environment production'
  sh 'cd ../'
  sh 'cd warm_it_up_rails'
  sh 'rm -rf public/ember-assets'
  sh 'cp -r ../warm_it_up_ember/dist/ public/assets'
  sh 'mv public/assets public/ember-assets'
  sh 'sed -i .bck s/assets/ember-assets/ public/index.html'
  sh 'mv public/index.html app/views/layouts/application.html.erb'
  sh 'rm -rf public_bk/'
  sh 'rm public/index.html.bck'
end
