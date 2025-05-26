workspace {

    model {
        user = person "User" {
            description "A player or administrator using the GeoQuest app."
        }

        geoQuestSystem = softwareSystem "GeoQuest MVP System" {
            description "Minimum Viable Product architecture for GeoQuest."

            # Frontend Clients
            hybridClient = container "MAUI App" {
                description "Main client app for quest creation and participation."
                technology "MAUI C#"
            }

            # API Gateway
            apiGateway = container "API Gateway" {
                description "Routes requests to backend services and handles authentication."
                technology "NGINX / API Gateway"
            }

            # Core Microservices
            userService = container "UserService" {
                description "Handles user registration, login, and profiles."
                technology "ASP.NET Core Web API"

                userApi = component "User API" {
                    description "Authentication and profile API."
                    technology "ASP.NET Core Web API"
                }

                userDatabase = component "User Database" {
                    description "Stores user accounts and profile data."
                    technology "PostgreSQL"
                }
            }

            gameService = container "GameService" {
                description "Manages quests and game logic."
                technology "ASP.NET Core Web API"

                gameApi = component "Game API"
                gameDatabase = component "Game Database"
                gameApi -> gameDatabase "Reads/writes game data"
            }

            challengeService = container "ChallengeService" {
                description "Handles quest challenges and their validation."
                technology "ASP.NET Core Web API"

                challengeApi = component "Challenge API"
                challengeDatabase = component "Challenge Database"
                challengeApi -> challengeDatabase "Reads/writes challenge data"
            }

            locationService = container "LocationService" {
                description "Tracks player locations and maps quests to real-world positions."
                technology "ASP.NET Core Web API"

                locationApi = component "Location API"
                locationDatabase = component "Location Database"
                locationApi -> locationDatabase "Reads/writes location data"
            }

            scoringService = container "ScoringService" {
                description "Calculates scores and times for quest completion."
                technology "ASP.NET Core Web API"

                scoringApi = component "Scoring API"
                scoringDatabase = component "Scoring Database"
                scoringApi -> scoringDatabase "Reads/writes score data"
            }

            teamService = container "TeamService" {
                description "Manages team creation and member coordination."
                technology "ASP.NET Core Web API"

                teamApi = component "Team API"
                teamDatabase = component "Team Database"
                teamApi -> teamDatabase "Reads/writes team data"
            }

            mediaService = container "MediaService" {
                description "Handles uploads of photos/videos as quest proof."
                technology "ASP.NET Core Web API"

                mediaApi = component "Media API"
                mediaStorage = component "Media Storage"
                mediaApi -> mediaStorage "Stores media files"
            }

            messageBus = container "Message Bus" {
                description "Asynchronous messaging between services."
                technology "Kafka / RabbitMQ / Azure Service Bus"
            }

            # Communication relationships
            user -> hybridClient "Uses"
            hybridClient -> apiGateway "Sends requests to"

            apiGateway -> userApi "Routes to"
            apiGateway -> gameApi "Routes to"
            apiGateway -> challengeApi "Routes to"
            apiGateway -> locationApi "Routes to"
            apiGateway -> scoringApi "Routes to"
            apiGateway -> teamApi "Routes to"
            apiGateway -> mediaApi "Routes to"

            # Database relationships
            userApi -> userDatabase
            gameApi -> gameDatabase
            challengeApi -> challengeDatabase
            locationApi -> locationDatabase
            scoringApi -> scoringDatabase
            teamApi -> teamDatabase
            mediaApi -> mediaStorage

            # Event bus interactions (for extensibility)
            gameApi -> messageBus "Publishes events"
            challengeApi -> messageBus "Publishes events"
            userApi -> messageBus "Publishes events"
            scoringApi -> messageBus "Publishes events"
            teamApi -> messageBus "Publishes events"
        }
    }

    views {
        systemContext geoQuestSystem {
            include *
            autolayout lr
        }

        container geoQuestSystem {
            include *
            autolayout lr
        }

        theme default
    }
}
