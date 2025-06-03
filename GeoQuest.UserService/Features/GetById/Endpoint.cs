using FastEndpoints;
using ChatMapper = GeoQuest.ChatService.Features.Shared.ChatMapper;

namespace GeoQuest.ChatService.Features.GetById
{
	internal sealed class Endpoint : Endpoint<Request, Response>
	{
		private readonly ChatMapper _mapper;

		public Endpoint(ChatMapper mapper) => _mapper = mapper;

		public override void Configure()
		{
			Get("/chat/messages/{Id}");
			AllowAnonymous();
		}

		public override async Task HandleAsync(Request req, CancellationToken c)
		{

			var response = new Response
			{
				Id = Guid.NewGuid(),
				SenderId = Guid.NewGuid(),
				Content = "Juhu",
				SentAt = DateTime.Now
			};


			await SendAsync(response);
		}
	}
}