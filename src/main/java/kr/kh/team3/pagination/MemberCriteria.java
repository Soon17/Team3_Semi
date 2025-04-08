package kr.kh.team3.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberCriteria extends Criteria{


	private String me_name;
    private String me_id;

    private String me_authority;
    private String me_del ;

	public MemberCriteria(int page, int perPageNum) {
		super(page, perPageNum);
	}
	
	
}
