workspace {

    model {
        user = person "User" {
            description "A player or administrator using the GeoQuest system."
        }

        geoQuestSystem = softwareSystem "GeoQuest System" {
            description "GeoQuest system architecture."
            
            # Frontend Clients
            webClient = container "WebAssembly" {
                description "Web client for administration and map viewing."
                technology "WebAssembly c#"
                tags "Future"
            } 

            hybridClient = container "MAUI" {
                description "Alternative for hybrid app."
                technology "MAUI c#"
            }

            # API Gateway
            apiGateway = container "API Gateway" {
                description "Handles routing, authentication, and load balancing for backend services."
                technology "NGINX / API Gateway"
            }

            # Microservices (each with an API and Database)
            gameService = container "GameService" {
                description "Creates and manages games."
                technology "Microservice"

                gameApi = component "Game API" {
                    description "REST API for game management."
                    technology "ASP.NET Core Web API"
                }

                gameDatabase = component "Game Database" {
                    description "Stores game configurations, progress, and results."
                    technology "PostgreSQL"
                }
            }

            teamService = container "TeamService" {
                description "Manages teams and participants."
                technology "Microservice"

                teamApi = component "Team API" {
                    description "REST API for team management."
                    technology "ASP.NET Core Web API"
                }

                teamDatabase = component "Team Database" {
                    description "Stores team and participant data."
                    technology "PostgreSQL"
                }
            }

            challengeService = container "ChallengeService" {
                description "Generates and validates challenges."
                technology "Microservice"

                challengeApi = component "Challenge API" {
                    description "REST API for challenge management."
                    technology "ASP.NET Core Web API"
                }

                challengeDatabase = component "Challenge Database" {
                    description "Stores challenge definitions and attempts."
                    technology "PostgreSQL"
                }
            }

            locationService = container "LocationService" {
                description "Map integration and GPS tracking."
                technology "Microservice"

                locationApi = component "Location API" {
                    description "REST API for location tracking."
                    technology "ASP.NET Core Web API"
                }

                locationDatabase = component "Location Database" {
                    description "Stores GPS data and map info."
                    technology "PostgreSQL"
                }
            }

            scoringService = container "ScoringService" {
                description "Calculates points and time based on challenges."
                technology "Microservice"

                scoringApi = component "Scoring API" {
                    description "REST API for calculating scores."
                    technology "ASP.NET Core Web API"
                }

                scoringDatabase = component "Scoring Database" {
                    description "Stores game scores and leaderboards."
                    technology "PostgreSQL"
                }
            }

            notificationService = container "NotificationService" {
                description "Real-time messaging and push notifications."
                technology "Microservice"

                notificationApi = component "Notification API" {
                    description "REST API for notifications."
                    technology "ASP.NET Core Web API"
                }

                notificationDatabase = component "Notification Database" {
                    description "Stores message history and push logs."
                    technology "PostgreSQL"
                }
            }

            chatService = container "ChatService" {
                description "Team-to-team chat."
                technology "Microservice"

                chatApi = component "Chat API" {
                    description "REST API for chat functionality."
                    technology "ASP.NET Core Web API"
                }

                chatDatabase = component "Chat Database" {
                    description "Stores chat messages."
                    technology "PostgreSQL"
                }
            }

            userService = container "UserService" {
                description "Authentication and user profiles."
                technology "Microservice"

                userApi = component "User API" {
                    description "REST API for user authentication and profile management."
                    technology "ASP.NET Core Web API"
                }

                userDatabase = component "User Database" {
                    description "Stores user profiles and credentials."
                    technology "PostgreSQL"
                }
            }

            mediaService = container "MediaService" {
                description "Storage of images/videos as proof of completed challenges."
                technology "Microservice"

                mediaApi = component "Media API" {
                    description "REST API for media uploads."
                    technology "ASP.NET Core Web API"
                }

                mediaStorage = component "Media Storage" {
                    description "Stores images and videos."
                    technology "AWS S3 / Azure Blob Storage"
                }
            }

            leaderboardService = container "LeaderboardService" {
                description "Generates real-time statistics and leaderboards."
                technology "Microservice"

                leaderboardApi = component "Leaderboard API" {
                    description "REST API for leaderboard management."
                    technology "ASP.NET Core Web API"
                }

                leaderboardDatabase = component "Leaderboard Database" {
                    description "Stores leaderboard rankings and statistics."
                    technology "PostgreSQL"
                }
            }

            feedService = container "FeedService" {
                description "Aggregates activity feed entries based on events from other services."
                technology "Microservice"

                feedApi = component "Feed API" {
                    description "REST API for retrieving personalized or global feed."
                    technology "ASP.NET Core Web API"
                }

                feedDatabase = component "Feed Database" {
                    description "Stores precomputed feed entries based on system events."
                    technology "PostgreSQL"
                }
            }

            messageBus = container "Message Bus" {
                description "Asynchronous communication infrastructure for events between services (e.g., Kafka, Azure Service Bus, RabbitMQ)."
                technology "Kafka / RabbitMQ / Azure Service Bus"
            }

        }

        # User interactions
        user -> webClient "Uses"{
            tags "Future"
        }
        user -> hybridClient "Uses"

        # UI to API Gateway interactions
        webClient -> apiGateway "Communicates with"{
            tags "Future"
        }
        hybridClient -> apiGateway "Communicates with"

        # API Gateway to Microservices
        apiGateway -> gameApi "Routes to"
        apiGateway -> teamApi "Routes to"
        apiGateway -> challengeApi "Routes to"
        apiGateway -> locationApi "Routes to"
        apiGateway -> scoringApi "Routes to"
        apiGateway -> notificationApi "Routes to"
        apiGateway -> chatApi "Routes to"
        apiGateway -> userApi "Routes to"
        apiGateway -> mediaApi "Routes to"
        apiGateway -> leaderboardApi "Routes to"
        apiGateway -> feedApi "Routes to"

        # API to Database/Storage interactions
        gameApi -> gameDatabase "Stores and retrieves data from"
        teamApi -> teamDatabase "Stores and retrieves data from"
        challengeApi -> challengeDatabase "Stores and retrieves data from"
        locationApi -> locationDatabase "Stores and retrieves data from"
        scoringApi -> scoringDatabase "Stores and retrieves data from"
        notificationApi -> notificationDatabase "Stores and retrieves data from"
        chatApi -> chatDatabase "Stores and retrieves data from"
        userApi -> userDatabase "Stores and retrieves data from"
        mediaApi -> mediaStorage "Stores and retrieves data from"
        leaderboardApi -> leaderboardDatabase "Stores and retrieves data from"
        feedApi -> feedDatabase "Stores and retrieves data from"

        # Tjenester som publiserer events
        challengeApi -> messageBus "Publishes events to/Consume from"
        gameApi -> messageBus "Publishes events to/Consume from"
        userApi -> messageBus "Publishes events to/Consume from"
        scoringApi -> messageBus "Publishes events to/Consume from"
        teamApi -> messageBus "Publishes events to/Consume from" 

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

        component gameService {
            include gameApi
            include gameDatabase
            autolayout lr
        }

        component teamService {
            include teamApi
            include teamDatabase
            autolayout lr
        }

        component challengeService {
            include challengeApi
            include challengeDatabase
            autolayout lr
        }

        component locationService {
            include locationApi
            include locationDatabase
            autolayout lr
        }

        component scoringService {
            include scoringApi
            include scoringDatabase
            autolayout lr
        }

        component notificationService {
            include notificationApi
            include notificationDatabase
            autolayout lr
        }

        component chatService {
            include chatApi
            include chatDatabase
            autolayout lr
        }

        component userService {
            include userApi
            include userDatabase
            autolayout lr
        }

        component mediaService {
            include mediaApi
            include mediaStorage
            autolayout lr
        }

        component leaderboardService {
            include leaderboardApi
            include leaderboardDatabase
            autolayout lr
        }

        theme default

        styles {
            element "Future" {
                background "#ffffff"
                color "#cccccc"
                border "Dashed"
                opacity 40
            }
            relationship "Future" {
                color "#cccccc"
                style "Dashed"
                opacity 40
            }
        }
    }

    
}
