#Requires -RunAsAdministrator
#Requires -Version 5.1

[CmdletBinding()]
param
(
	[Parameter(Mandatory = $false)]
	[string[]]
	$Functions
)

Clear-Host

$Host.UI.RawUI.WindowTitle = "Sophia Script for Windows 10 v5.12.12 | Made with $([char]::ConvertFromUtf32(0x1F497)) of Windows | $([char]0x00A9) farag & Inestic, 2014$([char]0x2013)2022"
Remove-Module -Name Sophia -Force -ErrorAction Ignore
Import-Module -Name $PSScriptRoot\Manifest\Sophia.psd1 -PassThru -Force
Import-LocalizedData -BindingVariable Global:Localization -FileName Sophia -BaseDirectory $PSScriptRoot\Localizations

#region Protection

Checkings -Warning
CreateRestorePoint

#endregion Protection

#region Privacy & Telemetry

DiagTrackService -Disable
DiagnosticDataLevel -Minimal
ErrorReporting -Disable
FeedbackFrequency -Never
ScheduledTasks -Disable
SigninInfo -Disable
LanguageListAccess -Disable
AdvertisingID -Disable
WindowsWelcomeExperience -Hide
WindowsTips -Disable
SettingsSuggestedContent -Hide
AppsSilentInstalling -Disable
WhatsNewInWindows -Disable
TailoredExperiences -Disable
BingSearch -Disable

#endregion Privacy & Telemetry

#region UI & Personalization

ThisPC -Hide
CheckBoxes -Disable
HiddenItems -Enable
FileExtensions -Show
MergeConflicts -Show
OpenFileExplorerTo -QuickAccess
CortanaButton -Hide
OneDriveFileExplorerAd -Hide
SnapAssist -Enable
FileTransferDialog -Detailed
FileExplorerRibbon -Minimized
RecycleBinDeleteConfirmation -Disable
3DObjects -Hide
QuickAccessRecentFiles -Hide
QuickAccessFrequentFolders -Hide
TaskViewButton -Hide
PeopleTaskbar -Hide
SecondsInSystemClock -Hide
TaskbarSearch -Hide
WindowsInkWorkspace -Hide
NotificationAreaIcons -Hide
MeetNow -Hide
NewsInterests -Disable
ControlPanelView -Category
WindowsColorMode -Dark
AppColorMode -Light
NewAppInstalledNotification -Hide
FirstLogonAnimation -Disable
JPEGWallpapersQuality -Max
TaskManagerWindow -Expanded
RestartNotification -Show
ShortcutsSuffix -Disable
PrtScnSnippingTool -Disable
AppsLanguageSwitch -Disable
AeroShaking -Disable
UnpinTaskbarShortcuts -Shortcuts Edge, Store, Mail

#endregion UI & Personalization

#region OneDrive

OneDrive -Uninstall

#endregion OneDrive

#region System

StorageSense -Enable
StorageSenseFrequency -Month
StorageSenseTempFiles -Enable
Hibernation -Enable
Win32LongPathLimit -Disable
BSoDStopError -Enable
AdminApprovalMode -Default
MappedDrivesAppElevatedAccess -Disable
DeliveryOptimization -Disable
WaitNetworkStartup -Disable
WindowsManageDefaultPrinter -Disable
WindowsFeatures -Disable
WindowsCapabilities -Uninstall
UpdateMicrosoftProducts -Disable
PowerPlan -High
LatestInstalled.NET -Enable
NetworkAdaptersSavePower -Disable
IPv6Component -Enable
InputMethod -English
SetUserShellFolderLocation -Default
WinPrtScrFolder -Default
RecommendedTroubleshooting -Default
FoldersLaunchSeparateProcess -Disable
ReservedStorage -Disable
F1HelpPage -Disable
NumLock -Disable
StickyShift -Disable
Autoplay -Disable
ThumbnailCacheRemoval -Enable
SaveRestartableApps -Disable
NetworkDiscovery -Disable
ActiveHours -Manually
RestartDeviceAfterUpdate -Enable
UninstallPCHealthCheck
InstallVCRedistx64

#endregion System

#region WSL

WSL

#endregion WSL

#region Start menu

RecentlyAddedApps -Hide
AppSuggestions -Hide
RunPowerShellShortcut -NonElevated
PinToStart -UnpinAll

#endregion Start menu

#region UWP apps

HEIF -Install
CortanaAutostart -Disable
BackgroundUWPApps -Disable
UninstallUWPApps -ForAllUsers

#endregion UWP apps

#region Gaming

XboxGameBar -Disable
XboxGameTips -Disable
GPUScheduling -Disable

#endregion Gaming

#region Scheduled tasks

CleanupTask -Register
SoftwareDistributionTask -Register
TempTask -Register

#endregion Scheduled tasks

#region Microsoft Defender & Security

NetworkProtection -Disable
PUAppsDetection -Disable
DefenderSandbox -Disable
AuditProcess -Disable
CommandLineProcessAudit -Disable
EventViewerCustomView -Disable
PowerShellModulesLogging -Disable
PowerShellScriptsLogging -Disable
AppsSmartScreen -Disable
SaveZoneInformation -Disable
WindowsScriptHost -Enable
WindowsSandbox -Disable
DismissMSAccount
DismissSmartScreenFilter

#endregion Microsoft Defender & Security

#region Context menu

MSIExtractContext -Show
CABInstallContext -Show
RunAsDifferentUserContext -Hide
CastToDeviceContext -Hide
ShareContext -Hide
EditWithPaint3DContext -Hide
EditWithPhotosContext -Hide
CreateANewVideoContext -Hide
ImagesEditContext -Show
PrintCMDContext -Hide
IncludeInLibraryContext -Hide
SendToContext -Show
BitLockerContext -Hide
BitmapImageNewContext -Hide
RichTextDocumentNewContext -Hide
CompressedFolderNewContext -Show
MultipleInvokeContext -Enable
UseStoreOpenWith -Hide

#endregion Context menu

RefreshEnvironment
Errors
