
package converters;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.convert.converter.Converter;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;

import domain.Chapter;
import repositories.ChapterRepository;

@Component
@Transactional
public class StringToChapterConverter implements Converter<String, Chapter> {

	@Autowired
	ChapterRepository	chapterRepository;


	@Override
	public Chapter convert(String text) {
		Chapter result;
		int id;

		try {
			if (StringUtils.isEmpty(text))
				result = null;
			else {
				id = Integer.valueOf(text);
				result = this.chapterRepository.findOne(id);
			}
		} catch (final Throwable oops) {
			throw new IllegalArgumentException(oops);
		}
		return result;
	}

}
