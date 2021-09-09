//
//  SharedAssembly.swift
//  appointment
//
//  Created by Raluca Mesterca on 13/02/2020.
//  Copyright © 2020 DTT. All rights reserved.
//

import UIKit
import Swinject
import SwinjectAutoregistration
//import Alamofire
import Connectivity

// swiftlint:disable implicit_return
// swiftlint:disable function_body_length
class SharedAssembly: Assembly {
    let sharedContainer = Container()

    func assemble(container: Container) {
        container.register(UIApplicationProtocol.self) { _ in UIApplication.shared }
        
        // Top View Controller Provider
        container.autoregister(TopViewControllerProviderProtocol.self, initializer: TopViewControllerProvider.init)
        
        //Root
        container.register(RootNavigatorProtocol.self) { resolver in
            return RootNavigator(
                application: resolver ~> UIApplicationProtocol.self,
                splashScreenStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.splashScreen.name),
                sideMenuStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.sideMenu.name),
                homeStoryboard: resolver ~> (Storyboard.self, name: R.storyboard.home.name)
            )
        }

        // AuthManager
        container.register(AuthManagerProtocol.self) { _ in
            return AuthManager(loginEndpoint: BaseURL.loginURL)
        }.inObjectScope(.container)

        // CoreDataController
        container.register(CoreDataControllerProtocol.self) { _ in
            return CoreDataController(modelName: "Appointment")
        }

        // DataValidator
        container.autoregister(DataValidatorProtocol.self, initializer: DataValidator.init)

        // Date Formatter
        container.register(DateFormatterProtocol.self) { _ in
            return DateFormatter()
        }

        // Alert presenter
        container.autoregister(AlertPresenterProtocol.self, initializer: AlertPresenter.init)

        // Connectivity
        container.register(ConnectivityProtocol.self) { _ in
            let connectivity = Connectivity()
            connectivity.connectivityURLs = [URL(string: "https://www.apple.com/library/test/success.html")!]
            return connectivity
        }
        
        // Error Handler
        container.autoregister(ErrorHandlerProtocol.self, initializer: ErrorHandler.init)
        
        // Calendar Blocks Model Provider
        container.autoregister(CalendarBlocksModelProviderProtocol.self, initializer: CalendarBlocksModelProvider.init)
        
        // Calendar
        container.register(CalendarProtocol.self) { _ in
            var calendar = Calendar(identifier: .gregorian)
            calendar.firstWeekday = WeekdayIndex.monday.rawValue
            return calendar
        }
        
        // Date Provider
        container.autoregister(DateProviderProtocol.self, initializer: DateProvider.init)
        
        // View Model Providers
        container.autoregister(AppointmentViewModelProviderProtocol.self, initializer: AppointmenViewModelProvider.init)

        // MARK: - Services

        // ProfileService
        container.register(UserProfileServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return UserProfileService(
                client: MoyaClient<UserProfileTarget>(authManager: authManager),
                authManager: authManager)
        }

        // Invitation Service
        container.register(InvitationServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return InvitationService(
                client: MoyaClient<AppointmentTarget>(authManager: authManager),
                authManager: authManager)
        }

        // Appointment Service
        container.register(AppointmentServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return AppointmentService(
                client: MoyaClient<AppointmentTarget>(authManager: authManager),
                authManager: authManager)
        }
        
        // Appointment Date Api Service
        container.register(AppointmentDateApiServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return AppointmentDateApiService(
                client: MoyaClient<AppointmentDateTarget>(authManager: authManager),
                authManager: authManager)
        }

        // Events Service
        container.register(EventsServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return EventsService(
                client: MoyaClient<EventsTarget>(authManager: authManager),
                authManager: authManager)
        }

        // Settings Service
        container.register(SettingsServiceProtocol.self) { resolver in
            let authManager = resolver ~> (AuthManagerProtocol.self)
            return SettingsService(
                client: MoyaClient<SettingsTarget>(authManager: authManager),
                authManager: authManager)
        }

        // MARK: - Database Services

        // User Data Service
        container.autoregister(CurrentUserDataServiceProtocol.self, initializer: CurrentUserDataService.init)

        // Appointments Data Service
        container.autoregister(AppointmentDataServiceProtocol.self, initializer: AppointmentDataService.init)

        // Events Data Service
         container.autoregister(EventsDataServiceProtocol.self, initializer: EventsDataService.init)

        // Settings Data Service
        container.autoregister(SettingsDataServiceProtocol.self, initializer: SettingsDataService.init)
        
        // Appointment Dates Service
        container.autoregister(AppointmentDateDataServiceProtocol.self, initializer: AppointmentDateDataService.init)

        // MARK: Managers

        // Database Sync Manager
        container.autoregister(DatabaseSyncManagerProtocol.self, initializer: DatabaseSyncManager.init)

        // MARK: Storyboards
        
        //Splash Screen
        container.register(Storyboard.self, name: R.storyboard.splashScreen.name) { _ in
            return SplashScreenStoryboard(sharedContainer: self.sharedContainer, assembly: SplashScreenAssembly())
        }
        
        // Login
        container.register(Storyboard.self, name: R.storyboard.login.name) { _ in
            return LoginStoryboard(sharedContainer: self.sharedContainer, assembly: LoginAssembly())
        }
        
        // Forgot Password
        container.register(Storyboard.self, name: R.storyboard.forgotPassword.name) { _ in
            return ForgotPasswordStoryboard(sharedContainer: self.sharedContainer, assembly: ForgotPasswordAssembly())
        }
        
        // Register
        container.register(Storyboard.self, name: R.storyboard.register.name) { _ in
            return RegisterStoryboard(sharedContainer: self.sharedContainer, assembly: RegisterAssembly())
        }

        // Tutorial
        container.register(Storyboard.self, name: R.storyboard.tutorial.name) { _ in
            return TutorialStoryboard(sharedContainer: self.sharedContainer, assembly: TutorialAssembly())
        }
        
        // Sync
        container.register(Storyboard.self, name: R.storyboard.sync.name) { _ in
            return SyncStoryboard(sharedContainer: self.sharedContainer, assembly: SyncAssembly())
        }

        // Custom PopUp
        container.register(Storyboard.self, name: R.storyboard.customPopUp.name) { _ in
            return CustomPopUpStoryboard(sharedContainer: self.sharedContainer, assembly: CustomPopUpAssembly())
        }
        // Side Menu
        container.register(Storyboard.self, name: R.storyboard.sideMenu.name) { _ in
            return SideMenuStoryboard(sharedContainer: self.sharedContainer, assembly: SideMenuAssembly())
        }

        // Home
        container.register(Storyboard.self, name: R.storyboard.home.name) { _ in
            return HomeStoryboard(sharedContainer: self.sharedContainer, assembly: HomeAssembly())
        }

        // Timeline
        container.register(Storyboard.self, name: R.storyboard.timeline.name) { _ in
            return TimelineStoryboard(sharedContainer: self.sharedContainer, assembly: TimelineAssembly())
        }

        // Invitation
        container.register(Storyboard.self, name: R.storyboard.invitation.name) { _ in
            return InvitationStoryboard(sharedContainer: self.sharedContainer, assembly: InvitationAssembly())
        }

        // Invitation Detail
        container.register(Storyboard.self, name: R.storyboard.invitationDetail.name) { _ in
            return InvitationDetailStoryboard(sharedContainer: self.sharedContainer, assembly: InvitationDetailAssembly())
        }

        // Chat
        container.register(Storyboard.self, name: R.storyboard.chat.name) { _ in
            return ChatStoryboard(sharedContainer: self.sharedContainer, assembly: ChatAssembly())
        }

        // Settings
        container.register(Storyboard.self, name: R.storyboard.settings.name) { _ in
            return SettingsStoryboard(sharedContainer: self.sharedContainer, assembly: SettingsAssembly())
        }
    }
}
