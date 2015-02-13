# vmware-utils DockerFile

Docker Image to deploy various VMware and open source related tools to manage a VMware environment

## Why? 

Most VMware Admins create their own box and modify the vMA so much that it becomes a problem when its time to upgrade to the latest version, this way they can easily build their own box and add their own scripts.

1. Download the latest version of vSphere CLI for vSphere 5.5 from here: https://developercenter.vmware.com/web/dp/tool/vsphere_cli/5.5
2. Download the latest version of VMware OVF Tool for Linux 64 bit from here: https://my.vmware.com/web/vmware/details?downloadGroup=OVFTOOL400&productId=353
3. Download / Clone the Dockerfile from this project


## Example folder structure
```.
└── VMware-Utils
    ├── Dockerfile
    ├── VMware-ovftool-4.0.0-2301625-lin.x86_64.bundle
    └── VMware-vSphere-CLI-5.5.0-2043780.x86_64.tar
```
That's it, now just use docker to deploy the image and watch as these and multiple other community projects and scripts are automatically downloaded.

## Example Build
1. CD into the file with the bits from above (VMware-Utils in my example).
2. sudo docker build -t alanrenouf/vmware-utils .

## Example run
```
alan@ubuntu:~/docker$ sudo docker run --rm -it alanrenouf/vmware-utils
root@b649422a095a:/tmp# vicfg-
vicfg-advcfg      vicfg-dns         vicfg-ipsec       vicfg-mpath       vicfg-nics        vicfg-route       vicfg-syslog      vicfg-volume      
vicfg-authconfig  vicfg-dumppart    vicfg-iscsi       vicfg-mpath35     vicfg-ntp         vicfg-scsidevs    vicfg-user        vicfg-vswitch     
vicfg-cfgbackup   vicfg-hostops     vicfg-module      vicfg-nas         vicfg-rescan      vicfg-snmp        vicfg-vmknic      
root@b649422a095a:/tmp# cd /root/vghetto/perl
root@b649422a095a:~/vghetto/perl# ls
addHostCustomField.pl                  getAllPowedOffVMs.pl                    hostops-lamw.pl                          updateDCUIBanner.pl
addVMAdvParamOption.pl                 getAllVMGuestHostname.pl                inefficent-upload-files-to-datastore.pl  updateVMBootOrder.pl
addVMAnnotation.pl                     getAllVMMacs.pl                         ipmiSettings.pl                          updateVMManagedBy.pl
addVMCustomField.pl                    getAssetTag.pl                          licenseManagement.pl                     updateVMPortgroup.pl
addvSwitchWSecurityPolicy.pl           getDatastoreUUID.pl                     listDatastoreFiles.pl                    updateVMReservations.pl
alarmManagement.pl                     getESXi5Hosts.pl                        listHAClusterNodes.pl                    updateVMToolsPolicy.pl
cdp.pl                                 getESXiHosts.pl                         listVMByFolder.pl                        upgradeVMVirtualHardware.pl
changeBlockTrackingManagement.pl       getEsxtop.pl                            listVMsInResourcePool.pl                 useVIFastpassOnvMAToRunPerlScriptWithoutClearTextPassword.pl
changeGuestOSID.pl                     getHostHardwareHealthInfo.pl            lunManagement.pl                         vAppManagement.pl
changeVMStoragePolicy.pl               getNumberOfvMotions.pl                  migratevFRCVM.pl                         vCenterAdvSettingMgmt.pl
checkESXiVersion.pl                    getNumofvCPUInCluster.pl                moRefFinder.pl                           vCloudVMLinkedClonesMapping.pl
checkLicenseServer.pl                  getRealVMDiskFormat.pl                  monitorUserLoginAlarm.pl                 vGhettoLinkedClone.pl
configureAdvHAClusterOptions.pl        getSSOUserExpiration.pl                 patch-host.pl                            vaaiHWAccelerationMgmt.pl
createResourcepool.pl                  getSupportedGuestOSes.pl                perfQuery.pl                             vflashHostMgmt.pl
createRole.pl                          getSupportedVirtualHardwareVersion.pl   pluginExtensionManager.pl                vflashVMMgmt.pl
datastoreClusterManagement.pl          getVINData.pl                           poweroff_suspend_vm.pl                   vmDiskSharesMgmt.pl
datastoreClusterVMProvisioning.pl      getVMAppStatus.pl                       provisionedVMReport.pl                   vmISOManagement.pl
efficent-upload-files-to-datastore.pl  getVMDiskCID.pl                         queryDeletedVMs.pl                       vmNICManagement.pl
enable16PlusVSANNodeSupport.pl         getVMDiskFormat.pl                      queryDiskParition.pl                     vmVMDKToDatastoreToDeviceMapping.pl
enumeratevifp40.pl                     getVMDiskInfo.pl                        querySvMotionVDSIssue.pl                 vmdkManagement.pl
enumeratevifp41.pl                     getVMMoRefID.pl                         queryVMCustomField.pl                    vmkfstools-lamw
esxcfg-perf.pl                         getVMThinProvisionedSavings.pl          queryVMsCreated.pl                       vmwareHealthCheck.pl
esxcfg-portgroup-mgmt.pl               getVMToolsStatus.pl                     queryVSANVMStoragePolicyMapping.pl       vmwarevSphereHealthCheck.pl
esxcfg-rename-datastore.pl             getVMonShareableAndNonSharDatastore.pl  queryvCenterCustomFields.pl              vmwarevSphereSecurityHardeningReportCheck.pl
esxcfg-vswitch-lamw-mod.pl             getVMsPerDatastore.pl                   rdmManagmement.pl                        vsanClusterManagement.pl
esxcli-automation.pl                   getVMsResourcePools.pl                  registerCustomSolution.pl                vsanConfigMaximumCheck.pl
executeCommandUsingFastPass.pl         getVscsiStats.pl                        registerVMX.pl                           vsanDatstoreFolderMgmt.pl
factoryResetESXi.pl                    getWWPN.pl                              remediateSvMotionVDSIssue.pl             vsanDiskHealth.pl
findLopsidedBootbanks.pl               getdvSwitchInfo.pl                      removeHostFromvCenterByForce.pl          vsanDiskStatsQueries.pl
findVMsWithRDMs.pl                     getvSwitchMacTable.pl                   removeOrphansFromvCenter.pl              vsanFlashAndMDCapacity.pl
floppyManagement.pl                    getvswif.pl                             renameLocalStorageDatastore.pl           vsanHostDiskMapping.pl
ftCLI.pl                               ghettoCloneVM.pl                        rescanAllHBAInCluster.pl                 vsanHostMaintenanceMode.pl
ftCLI2.pl                              ghettoHostBackupManagement.pl           sessionManagement.pl                     vsanHostStatus.pl
generateDCUIScreen.pl                  ghettoHostProfile.pl                    setOvfEnv.pl                             vsanHostTrafficTypeMgmt.pl
generateESXiHostsList.pl               ghettoUPSHostShutdown.pl                setUserDatastorePermission.pl            vsanQueryDisksForUse.pl
generateHTML5VMConsole.pl              ghettoVCBg2.pl                          setVMAgeCustomField.pl                   wheresMyCOSVMDKAt.pl
generateHostConfigurationWorksheet.pl  guestOpsManagement.pl                   shutdownHostViaSOAPAPICall.pl            whichClusterIsMyVMIn.pl
generateLogBundle.pl                   hostCacheManagement.pl                  siocManagement.pl
generateVMList.pl                      hostOperations.pl                       storageProfileMgmt.pl
generateVMRemoteConsoleURL.pl          hostServiceManagement.pl                takeVMScreenshot.pl
root@b649422a095a:~/vghetto/perl#
```
