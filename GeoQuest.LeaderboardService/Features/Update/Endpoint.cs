using FastEndpoints;
using GeoQuest.ChatService.Features.Shared;

namespace GeoQuest.ChatService.Features.Update
{
	internal sealed class Endpoint : Endpoint<UpdateChatRequest>
	{
		private readonly ChatMapper _mapper;

		public Endpoint(ChatMapper mapper) => _mapper = mapper;

		public override void Configure()
		{
			Put("/chat/messages/{Id}");
			AllowAnonymous();
		}

		public override async Task HandleAsync(UpdateChatRequest req, CancellationToken c)
		{
			var entity = _mapper.ToEntity(req);

			//Lagre meldingen i databasen eller en annen lagringsløsning


			var response = _mapper.ToResponse(entity);

			await SendOkAsync();
		}
	}
}