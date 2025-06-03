using GeoQuest.ChatService.Features.Send;
using GeoQuest.ChatService.Features.Update;
using Riok.Mapperly.Abstractions;

namespace GeoQuest.ChatService.Features.Shared
{
	[Mapper]
	public partial class ChatMapper
	{
		
		public partial Data ToEntity(SendChatRequest req);
		public partial SendChatResponse ToResponse(Data message);
		
		public partial Data ToEntity(UpdateChatRequest req);


	}
}
