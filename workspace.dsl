workspace {

    model {
        user = person "User" {
            description "A player or administrator using the GeoQuest system."
        }

        geoQuestSystem = softwareSystem "GeoQuest System" {
            description "GeoQuest system architecture."
            
            webClient = container "Blazor WebAssembly" {
                description "Web client for administration and map viewing."
                technology "WebAssembly"
            }

            mobileClient = container "React Native" {
                description "Mobile app for players."
                technology "React Native"
            }

            hybridClient = container "MAUI" {
                description "Alternative for hybrid app."
                technology "MAUI"
            }

            gameService = container "GameService" {
                description "Creates and manages games."
                technology "Microservice"
            }

            teamService = container "TeamService" {
                description "Manages teams and participants."
                technology "Microservice"
            }

            challengeService = container "ChallengeService" {
                description "Generates and validates challenges."
                technology "Microservice"
            }

            locationService = container "LocationService" {
                description "Map integration and GPS tracking."
                technology "Microservice"
            }

            scoringService = container "ScoringService" {
                description "Calculates points and time based on challenges."
                technology "Microservice"
            }

            notificationService = container "NotificationService" {
                description "Real-time messaging and push notifications."
                technology "Microservice"
            }

            chatService = container "ChatService" {
                description "Team-to-team chat."
                technology "Microservice"
            }

            userService = container "UserService" {
                description "Authentication and user profiles."
                technology "Microservice"
            }

            mediaService = container "MediaService" {
                description "Storage of images/videos as proof of completed challenges."
                technology "Microservice"
            }

            leaderboardService = container "LeaderboardService" {
                description "Generates real-time statistics and leaderboards."
                technology "Microservice"
            }
        }

        user -> webClient "Uses"
        user -> mobileClient "Uses"
        user -> hybridClient "Uses"

        webClient -> gameService "Interacts with"
        webClient -> teamService "Interacts with"
        webClient -> challengeService "Interacts with"
        webClient -> locationService "Interacts with"
        webClient -> scoringService "Interacts with"
        webClient -> notificationService "Interacts with"
        webClient -> chatService "Interacts with"
        webClient -> userService "Interacts with"
        webClient -> mediaService "Interacts with"
        webClient -> leaderboardService "Interacts with"

        mobileClient -> gameService "Interacts with"
        mobileClient -> teamService "Interacts with"
        mobileClient -> challengeService "Interacts with"
        mobileClient -> locationService "Interacts with"
        mobileClient -> scoringService "Interacts with"
        mobileClient -> notificationService "Interacts with"
        mobileClient -> chatService "Interacts with"
        mobileClient -> userService "Interacts with"
        mobileClient -> mediaService "Interacts with"
        mobileClient -> leaderboardService "Interacts with"

        hybridClient -> gameService "Interacts with"
        hybridClient -> teamService "Interacts with"
        hybridClient -> challengeService "Interacts with"
        hybridClient -> locationService "Interacts with"
        hybridClient -> scoringService "Interacts with"
        hybridClient -> notificationService "Interacts with"
        hybridClient -> chatService "Interacts with"
        hybridClient -> userService "Interacts with"
        hybridClient -> mediaService "Interacts with"
        hybridClient -> leaderboardService "Interacts with"
    }

    views {
        systemContext geoQuestSystem {
            include geoQuestSystem
            autolayout lr
        }

        container geoQuestSystem {
            include webClient
            
            autolayout lr
        }

        theme default
    }
}
