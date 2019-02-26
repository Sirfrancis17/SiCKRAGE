# This file is part of SickRage.
#
# URL: https://www.sickrage.ca
# Git: https://git.sickrage.ca/SiCKRAGE/sickrage.git
#
# SickRage is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# SickRage is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with SickRage.  If not, see <http://www.gnu.org/licenses/>.



import os

from sickrage.core.caches.image_cache import ImageCache
from sickrage.core.media import Media


class Poster(Media):
    """
    Get the poster of a show
    """

    def __init__(self, indexer_id, media_format='normal'):
        super(Poster, self).__init__(indexer_id, media_format)

    def get_default_media_name(self):
        return 'poster-thumb.png' if self.media_format == 'thumb' else 'poster.png'

    def get_media_path(self):
        media_file = ''

        if self.media_format == 'normal':
            media_file = ImageCache().poster_path(self.indexer_id)

        if self.media_format == 'thumb':
            media_file = ImageCache().poster_thumb_path(self.indexer_id)

        if not all([media_file, os.path.exists(media_file)]):
            media_file = os.path.join(self.get_media_root(), 'images', self.get_default_media_name())

        return media_file
