using FastEndpoints;

namespace GeoQuest.ChatService.Features.Update
{
	public record UpdateChatRequest
	{
		           
		public string NewContent { get; set; } = string.Empty;

		internal sealed class Validator : Validator<UpdateChatRequest>
		{
			public Validator()
			{

			}
		}
	}

	public record UpdateChatResponse
	{
		public Guid MessageId { get; set; }
		public DateTime UpdatedAtUtc { get; set; }
		public string Message { get; set; } = string.Empty;
	}
}
