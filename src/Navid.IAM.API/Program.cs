using Pargoon.ApiVersioning;
using System.Reflection;

var builder = WebApplication.CreateBuilder(args);


builder.Services.AddControllers();

builder.Services.AddEndpointsApiExplorer();
var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);
builder.Services.AddSwaggerService(xmlPath);

var app = builder.Build();

app.UseSwaggerVersioned(showSwaggerInAllEnv: true);

app.UseAuthorization();

app.MapControllers();

app.Run();
