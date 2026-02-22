from quotebot.tech_blogs import TechBlogs


class AdSpace:

    _cache = {}

    @staticmethod
    def get_ad_spaces():
        if "blogs list" in AdSpace._cache:
            return AdSpace._cache["blogs list"]
        # FIXME : only return blogs that start with a 'T'
        list_all_blogs = TechBlogs.list_all_blogs()
        AdSpace._cache["blogs list"] = list_all_blogs
        return list_all_blogs
