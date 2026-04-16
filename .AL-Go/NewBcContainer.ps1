$parameters.additionalParameters += ' --dns 8.8.8.8'
$parameters.isolation = 'hyperv'
new-bccontainer @parameters