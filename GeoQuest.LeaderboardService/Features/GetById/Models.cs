using FastEndpoints;

namespace GeoQuest.ChatService.Features.GetById
{
	public record Request
	{
		public Guid Id { get; set; } = default!;

		internal sealed class Validator : Validator<Request>
		{
			public Validator()
			{

			}
		}
	}

	public record Response
	{
		public Guid Id { get; set; } = default!;
		public Guid SenderId { get; set; } = default!;
		public string Content { get; set; } = default!;
		public DateTime SentAt { get; set; }
	}
}
