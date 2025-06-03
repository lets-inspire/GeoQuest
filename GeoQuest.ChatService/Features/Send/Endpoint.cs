using FastEndpoints;
using ChatMapper = GeoQuest.ChatService.Features.Shared.ChatMapper;

namespace GeoQuest.ChatService.Features.Send
{
	internal sealed class Endpoint : Endpoint<SendChatRequest, SendChatResponse>
	{
		private readonly ChatMapper _mapper;

		public Endpoint(ChatMapper mapper) => _mapper = mapper;

		public override void Configure()
		{
			Post("/chat/messages");
			AllowAnonymous();
		}

		public override async Task HandleAsync(SendChatRequest req, CancellationToken c)
		{
			var entity = _mapper.ToEntity(req);
			
			//Lagre meldingen i databasen eller en annen lagringsløsning


			var response = _mapper.ToResponse(entity);
			await SendAsync(response);
		}
	}
}