name "uuid"
default_version "1.30"

dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --build #{project_dir} --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
