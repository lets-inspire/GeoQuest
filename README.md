# GeoQuest – Mikrotjenestebasert arkitektur med Aspire og FastEndpoints

GeoQuest er en distribuert applikasjon bygget som et sett med mikrotjenester basert på .NET Aspire, FastEndpoints og moderne utviklingsverktøy. Hver tjeneste er isolert, uavhengig deployerbar og kommuniserer asynkront der det er hensiktsmessig.

## 🔧 Teknologistack

- [.NET 9.0](https://dotnet.microsoft.com/en-us/)
- [Aspire](https://learn.microsoft.com/en-us/dotnet/aspire/) for applikasjonssammensetning og lokal utvikling
- [FastEndpoints](https://fast-endpoints.com/) for minimal API og høy ytelse
- [Mapperly](https://mapperly.riok.app/) for rask og sikker objektmapping
- PostgreSQL som database per tjeneste
- Redis som cache
- RabbitMQ som meldingsbuss (asynkron kommunikasjon)
- Azure Blob Storage for mediefiler
- Swagger/OpenAPI for dokumentasjon

---

## 🧱 Tjenestestruktur

Alle tjenester bruker følgende grunnstruktur:

```xml
<Project Sdk="Microsoft.NET.Sdk.Web">

  <PropertyGroup>
    <TargetFramework>net9.0</TargetFramework>
    <ImplicitUsings>enable</ImplicitUsings>
    <Nullable>enable</Nullable>
  </PropertyGroup>

  <ItemGroup>
    <ProjectReference Include="..\GeoQuest.ServiceDefaults\GeoQuest.ServiceDefaults.csproj" />
  </ItemGroup>

  <ItemGroup>
    <PackageReference Include="FastEndpoints.Swagger" Version="6.1.0" />
    <PackageReference Include="Microsoft.AspNetCore.OpenApi" Version="9.0.5" />
    <PackageReference Include="Riok.Mapperly" Version="4.2.1" />
  </ItemGroup>

</Project>
```

`GeoQuest.ServiceDefaults` inneholder fellesoppsett for logging, autentisering, telemetry og andre krysskuttene bekymringer.

---

## 🧩 Mikrotjenester

| Tjeneste             | Ansvar                                                                 |
|----------------------|------------------------------------------------------------------------|
| GameChallengeService | Håndterer spill, quester, progresjon og geobaserte utfordringer        |
| TeamService          | Håndterer lag og påmeldinger                                           |
| LocationService      | Håndterer geokoordinater og ruter                                      |
| ScoringService       | Poeng og resultatberegning                                             |
| LeaderboardService   | Rangering og highscore                                                 |
| NotificationService  | Varsler og push-notifikasjoner                                         |
| FeedService          | Venneaktiviteter og feed                                               |
| ChatService          | Sanntidsmeldinger og samtalehistorikk                                 |
| UserService          | Brukerprofiler og autentisering                                        |
| MediaService         | Lagring og visning av bilder/videoer knyttet til spill og utfordringer|
| API Gateway          | Eventuelt mellomlag for routing og sikkerhet                           |
| WebClient/HybridApp  | Klienter (WASM og MAUI)                                                |

---

## 🚀 Aspire AppHost

Løsningen bruker en `AppHost`-prosjektfil som samler og konfigurerer hele systemet for lokal utvikling og orkestrering, inkludert databaser, meldingsbuss og Redis. Det gjør det enkelt å utvikle, teste og feilsøke hele applikasjonen i én enkelt kontekst.

---

## 🗂️ Katalogstruktur

```bash
/GeoQuest.AppHost
/GeoQuest.GameChallengeService
/GeoQuest.TeamService
/GeoQuest.LocationService
...
/GeoQuest.ServiceDefaults
/Clients/WebClient
/Clients/MauiApp
```

---

## 📝 Dokumentasjon

- Swagger tilgjengelig på `/swagger` per tjeneste ved oppstart
- Aspire-dashboard gir oversikt over status, logs og metrics

---

## 📦 Kom i gang

```bash
dotnet run --project GeoQuest.AppHost
```

---

## 🧪 Testing og videreutvikling

- Bruk Aspire-dashboard til å overvåke tjenester og helse
- Lag egne integrationtests per mikrotjeneste
- Utvid med flere tjenester som `BadgeService` eller `ActivityTracking` etter behov

---

## 🧠 Tips

- Hold hver tjeneste liten og fokusert
- Bruk meldingsbuss for løs kobling og asynkron prosessering
- Bruk `ServiceDefaults` for DRY-konfigurasjon

---