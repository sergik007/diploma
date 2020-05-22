package by.bsuir.util;

import javax.persistence.AttributeConverter;
import javax.persistence.Converter;
import java.time.LocalTime;

@Converter(autoApply = true)
public class LocalTimeToTimeConverter implements AttributeConverter<LocalTime, java.sql.Time> {
    @Override
    public java.sql.Time convertToDatabaseColumn(LocalTime entityValue) {
        if (entityValue != null) {
            return java.sql.Time.valueOf(entityValue);
        }
        return null;
    }

    @Override
    public LocalTime convertToEntityAttribute(java.sql.Time databaseValue) {
        if (databaseValue != null) {
            return databaseValue.toLocalTime();
        }
        return null;
    }
}
