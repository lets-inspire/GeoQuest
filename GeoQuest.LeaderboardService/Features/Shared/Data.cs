namespace GeoQuest.ChatService.Features.Shared
{
	public sealed class Data
	{
		public Guid Id { get; set; } = Guid.NewGuid();
		public Guid SenderUserId { get; set; }
		public Guid? ReceiverUserId { get; set; }
		public Guid? TeamId { get; set; }
		public string Message { get; set; } = string.Empty;
		public DateTime SentAtUtc { get; set; } = DateTime.UtcNow;

		public DateTime UpdatedAtUtc { get; set; } = DateTime.UtcNow;

	}
}
