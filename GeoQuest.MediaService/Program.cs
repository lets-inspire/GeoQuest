using FastEndpoints;
using FastEndpoints.Swagger;

var builder = WebApplication.CreateBuilder(args);

// Add service defaults & Aspire client integrations.
builder.AddServiceDefaults();

// Add services to the container.
builder.Services.AddProblemDetails();

// Learn more about configuring OpenAPI at https://aka.ms/aspnet/openapi
builder.Services.AddFastEndpoints().SwaggerDocument(); 

var app = builder.Build();
app.UseExceptionHandler();
app.UseFastEndpoints().UseSwaggerGen();
app.MapDefaultEndpoints();

app.Run();
