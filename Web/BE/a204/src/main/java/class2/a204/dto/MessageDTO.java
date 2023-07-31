package class2.a204.dto;

import lombok.*;

@Getter
@Setter
@AllArgsConstructor
@Builder
public class MessageDTO {
    String to;
    String content;
}
