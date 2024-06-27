

import Foundation

enum txtDataLoclzed {
    
    enum alertNoIntConn {
        static let title = String(localized: "AlertTitle")
        static let message = String(localized: "AlertMessage")
        static let actionTitle = String(localized: "AlertOkActionTitle")
    }
    
    enum dtaSubstrction {
        
        enum scrnFirst {
            static let label = String(localized: "FirstSubscriptionLabelText")
        }
        
        enum scrnSecound {
            static let label = String(localized: "SecondSubscriptionLabelText")
        }
        
        enum scrnFinal {
            static let label = String(localized: "FinalSubscriptionLabelText")
            static let firstBoldLabel = String(localized: "FinalSubscriptionFirstBoldLabelText")
            static let firstLightLabel = String(localized: "FinalSubscriptionFirstLightLabelText")
            
            static let secondBoldLabel = String(localized: "FinalSubscriptionSecondBoldLabelText")
            static let secondLightLabel = String(localized: "FinalSubscriptionSecondLightLabelText")
            
            static let thirdBoldLabel = String(localized: "FinalSubscriptionThirdBoldLabelText")
            static let thirdLightLabel = String(localized: "FinalSubscriptionThirdLightLabelText")
        }
        
        static let continueButton = String(localized: "CustomContinueButtonText")
    }
    
    enum scrnLaunch {
        static let noInternet = String(localized: "LaunchNoInternetConnectionText")
        static let noGPS = String(localized: "No GPS connection")
        static let tapToReconnect = String(localized: "TapToReconnect")
        static let pleaseTryAgain = String(localized: "Please Try Again")
    }
    
    enum AppSettingTexts {
        static let barometer = String(localized: "BarometerText")
        static let coordinates = String(localized: "CoordinatesText")
        static let address = String(localized: "AddressText")
    }
    
    enum BarSetting {
        static let menu = String(localized: "MenuText")
        static let settings = String(localized: "SettingsText")
        static let general = String(localized: "GeneralText")
        static let altitude = String(localized: "Altitude")
        static let coordinate = String(localized: "CoordinateText")
        static let velocity = String(localized: "VelocityText")
        static let barometer = String(localized: "BarometerText")
        
        static let help = String(localized: "MenuHelpText")
        static let resetPopups = String(localized: "MenuResetPopupsText")
        static let ourApps = String(localized: "MenuOurApplicationsText")
        static let rateApp = String(localized: "MenuRateTheApplicationText")
        static let feedback = String(localized: "MenuFeedbackText")
        static let removeADS = String(localized: "MenuRemoveAdsText")
    }
    
    enum ScrnShre {
        static let share = String(localized: "Share")
        static let Altimetr_Information = String(localized: "Altimetr Information")
        static let addPhoto = String(localized: "ShareVCAddPhotoButtonText")
        static let photo = String(localized: "SharePhotoButtonText")
        static let location = String(localized: "ShareLocationButtonText")
        
        enum txtShareScrn{
            static let latitude = String(localized: "Latitude")
            static let longitude = String(localized: "Longitude")
            static let altitude = String(localized: "Altitude")
            static let shareAddress = String(localized: "Address")
            static let shareAppleMapsLink = String(localized: "Apple Maps Link")
            static let shareGoogleMapsLink = String(localized: "Google Maps Link")
            static let referenceApp = String(localized: "Reference App")
        }
        
        enum alertShareCam {
            static let shareCameraAlertTitle = String(localized: "ShareCameraAlertTitle")
            static let shareCameraAlertMessage = String(localized: "ShareCameraAlertMessage")
            static let shareAlertCancel = String(localized: "Cancel")
            static let shareAllowCamera = String(localized: "AllowCamera")
        }
    }
}
