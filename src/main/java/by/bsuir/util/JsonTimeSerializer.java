package by.bsuir.util;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;

import java.io.IOException;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

public class JsonTimeSerializer extends JsonSerializer<LocalTime> {

    private final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");

    @Override
    public void serialize(LocalTime time, JsonGenerator generator,
                          SerializerProvider provider) throws IOException,
            JsonProcessingException {

        String dateString = time.format(formatter);
        generator.writeString(dateString);
    }
}
