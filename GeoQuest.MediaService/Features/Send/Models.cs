using FastEndpoints;
using FluentValidation;

namespace GeoQuest.ChatService.Features.Send
{
	public record SendChatRequest
	{
		public Guid SenderUserId { get; set; }
		public Guid? ReceiverUserId { get; set; }     
		public Guid? TeamId { get; set; }             
		public string Message { get; set; } = string.Empty;

		internal sealed class Validator : Validator<SendChatRequest>
		{
			public Validator()
			{
				RuleFor(e => e.Message)
					.NotEmpty().NotNull().WithMessage("Please specify a message")
					.Length(12).WithMessage("minimum 12 bokstaver");
			}
		}
	}

	public record SendChatResponse
	{
		public Guid MessageId { get; set; }
		public DateTime SentAtUtc { get; set; }
		public string Message { get; set; } = string.Empty;
	}
}
