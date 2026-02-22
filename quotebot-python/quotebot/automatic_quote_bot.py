from quotebot.ad_space import AdSpace
from quotebot.blog_auction_task import BlogAuctionTask


class AutomaticQuoteBot:

    def send_all_quotes(self, mode):
        blogs = AdSpace.get_ad_spaces()
        for blog in blogs:
            auction_task = BlogAuctionTask()
            auction_task.price_and_publish(blog, mode)
