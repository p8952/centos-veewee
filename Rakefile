task :clean do
	FileUtils.rm('Vagrantfile') if File.exist?('Vagrantfile')
	FileUtils.rm('centos-6.5.box') if File.exist?('centos-6.5.box')

	system('VBoxManage showvminfo centos-6.5 > /dev/null 2>&1')
	if $?.exitstatus == 0
		system('VBoxManage list runningvms | grep centos-6.5 > /dev/null 2>&1')
		if $?.exitstatus == 0
			system('VBoxManage controlvm centos-6.5 poweroff')
		end
		system('VBoxManage unregistervm --delete centos-6.5')
	end
	
	system('vagrant box list | grep centos-6.5 > /dev/null 2>&1')
	if $?.exitstatus == 0
		system('vagrant box remove centos-6.5')
	end
end

task :veewee_build do
	#system('veewee vbox build centos-6.5 --auto --nogui')
	system('veewee vbox build centos-6.5 --auto')
end

task :veewee_export do
	system('VBoxManage list runningvms | grep centos-6.5 > /dev/null 2>&1')
	while $?.exitstatus == 0 do
		sleep 5
		system('VBoxManage list runningvms | grep centos-6.5 > /dev/null 2>&1')
	end
	system('veewee vbox export centos-6.5')
end

task :vagrant_import do
	system('vagrant box add centos-6.5 centos-6.5.box')
	system('vagrant init centos-6.5')
end

task :build => [:clean, :veewee_build, :veewee_export, :vagrant_import]
