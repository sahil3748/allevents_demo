class EventModel {
  String? eventId;
  String? eventName;
  String? eventLocation;
  String? eventDate;
  String? eventUrl;
  String? eventShareUrl;
  String? eventImageUrl;
  String? eventScore;
  bool? eventHasTicket;
  // String? eventTicketMinPrize;
  // String? eventTicketCurrency;

  EventModel({
    this.eventId,
    this.eventName,
    this.eventLocation,
    this.eventDate,
    this.eventUrl,
    this.eventShareUrl,
    this.eventImageUrl,
    this.eventScore,
    this.eventHasTicket,
    // this.eventTicketMinPrize,
    // this.eventTicketCurrency
  });
}
