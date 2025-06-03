using FastEndpoints;

namespace GeoQuest.ChatService.Features.Delete
{
	public record Request
	{
		public Guid SenderUserId { get; set; }
		public Guid? ReceiverUserId { get; set; }     
		public Guid? TeamId { get; set; }             
		public string Message { get; set; } = string.Empty;

		internal sealed class Validator : Validator<Request>
		{
			public Validator()
			{
				
			}
		}
	}

	public record Response
	{
		public Guid MessageId { get; set; }
		public DateTime SentAtUtc { get; set; }
		public string Message { get; set; } = string.Empty;
	}
}
