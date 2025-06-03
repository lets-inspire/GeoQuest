using FastEndpoints;
using ChatMapper = GeoQuest.ChatService.Features.Shared.ChatMapper;

namespace GeoQuest.ChatService.Features.Delete
{
	internal sealed class Endpoint : Endpoint<Request>
	{
		private readonly ChatMapper _mapper;

		public Endpoint(ChatMapper mapper) => _mapper = mapper;

		public override void Configure()
		{
			Delete("/chat/messages/{Id}");
			AllowAnonymous();
		}

		public override async Task HandleAsync(Request req, CancellationToken c)
		{
			
			await SendOkAsync();
		}
	}
}