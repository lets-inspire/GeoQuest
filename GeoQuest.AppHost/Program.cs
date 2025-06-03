using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);


var redis = builder.AddRedis("cache");

var messageBus = builder.AddRabbitMQ("rabbitmq");

var mediaStorage = builder
	.AddAzureStorage("media-storage")
	.AddBlobs("blobs");

var gameDb = builder.AddPostgres("game-db").WithImage("postgres:16");
var teamDb = builder.AddPostgres("team-db").WithImage("postgres:16");
var locationDb = builder.AddPostgres("location-db").WithImage("postgres:16");
var scoringDb = builder.AddPostgres("scoring-db").WithImage("postgres:16");
var notificationDb = builder.AddPostgres("notification-db").WithImage("postgres:16");
var chatDb = builder.AddPostgres("chat-db").WithImage("postgres:16");
var userDb = builder.AddPostgres("user-db").WithImage("postgres:16");
var leaderboardDb = builder.AddPostgres("leaderboard-db").WithImage("postgres:16");
var feedDb = builder.AddPostgres("feed-db").WithImage("postgres:16");

builder.AddProject<Projects.GeoQuest_GameChallengeService>("game-service")
	.WithReference(gameDb)
	.WithReference(messageBus)
	.WaitFor(gameDb);

builder.AddProject<Projects.GeoQuest_TeamService>("team-service")
	.WithReference(teamDb)
	.WithReference(messageBus)
	.WaitFor(teamDb);

builder.AddProject<Projects.GeoQuest_LocationService>("location-service")
	.WithReference(locationDb)
	.WaitFor(locationDb);

builder.AddProject<Projects.GeoQuest_ScoringService>("scoring-service")
	.WithReference(scoringDb)
	.WithReference(messageBus)
	.WaitFor(scoringDb);

builder.AddProject<Projects.GeoQuest_NotificationService>("notification-service")
	.WithReference(notificationDb)
	.WaitFor(notificationDb);

builder.AddProject<Projects.GeoQuest_ChatService>("chat-service")
	.WithReference(chatDb)
	.WaitFor(locationDb);

builder.AddProject<Projects.GeoQuest_UserService>("user-service")
	.WithReference(userDb)
	.WithReference(messageBus)
	.WaitFor(userDb);

builder.AddProject<Projects.GeoQuest_LeaderBoardService>("leaderboard-service")
	.WithReference(leaderboardDb)
	.WaitFor(leaderboardDb);

builder.AddProject<Projects.GeoQuest_FeedService>("feed-service")
	.WithReference(feedDb)
	.WithReference(messageBus)
	.WaitFor(feedDb);

builder.AddProject<Projects.GeoQuest_MediaService>("media-service")
	.WithReference(mediaStorage)
	.WaitFor(mediaStorage);


builder.AddProject<Projects.GeoQuest_Web>("web-client");

builder.Build().Run();
