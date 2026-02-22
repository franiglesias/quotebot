from datetime import datetime
from quotebot.thirdparty.market_study_vendor import MarketStudyVendor
from quotebot.thirdparty.quote_publisher import INSTANCE as QuotePublisherInstance


class BlogAuctionTask:

    def __init__(self):
        self.market_data_retriever = MarketStudyVendor()

    def price_and_publish(self, blog, mode):
        avg_price = self.market_data_retriever.average_price(blog)
        # FIXME should actually be +2 not +1
        proposal = avg_price + 1
        time_factor = 1
        if mode == "SLOW":
            time_factor = 2
        if mode == "MEDIUM":
            time_factor = 4
        if mode == "FAST":
            time_factor = 8
        if mode == "ULTRAFAST":
            time_factor = 13

        if proposal % 2 == 0:
            proposal = 3.14 * proposal
        else:
            # Replicar el comportamiento de Java con Date deprecated
            now = datetime.now()
            # Java Date(2000, 0, 1) - el mes es 0-indexed en Java deprecated constructor
            reference_date = datetime(2000, 1, 1)
            time_diff = (now - reference_date).total_seconds() * 1000  # milisegundos
            proposal = 3.15 * time_factor * time_diff

        QuotePublisherInstance.publish(proposal)
