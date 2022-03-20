function matched_partner=stable_comparison(CUE,D2D,preference_CUE_comparison,preference_D2D_comparison)
matched_partner=containers.Map('KeyType','int32','ValueType','int32');
D2D_origin=D2D;
while size(D2D,2)>0
     most_preferred=show_most_preferred(preference_D2D_comparison);
     new_most_preferred=clean_most_preferred(most_preferred,D2D,D2D_origin);
     proposal=match_most_preferred_comparison(new_most_preferred,D2D,CUE);
     for i=1:size(D2D,2)
         link=D2D(i);
         if link==0
           continue;
         end
         preference_i=preference_D2D_comparison{link,2};
         most_preferred_i=preference_i(1);
         proposal_most_preferred_i=proposal(most_preferred_i);
         if size(proposal_most_preferred_i,2)>1
           continue;
         elseif size(proposal_most_preferred_i,2)==1
           matched_partner(link)=most_preferred_i;
           D2D(i)=0;
         end
     end
     new_D2D=D2D(D2D~=0);
     unmatched_D2D_index=[];
     for j=1:size(new_D2D,2)
         link=new_D2D(j);
         if link==0
           continue;
         end
         preference_j=preference_D2D_comparison{link,2};
         most_preferred_j=preference_j(1);
         proposal_most_preferred_j=proposal(most_preferred_j);
         if size(proposal_most_preferred_j,2)==1
           continue;
         elseif size(proposal_most_preferred_j,2)>1
                CUE_preference_sub=preference_CUE_comparison{most_preferred_j,2};
               index_more_preferred=CUE_more_preferred(CUE_preference_sub,proposal_most_preferred_j);
               if size(index_more_preferred,2)>0
                    chosen_preference=CUE_preference_sub(index_more_preferred);
                    matched_partner(chosen_preference)=most_preferred_j;
                    new_D2D(new_D2D==D2D_origin(chosen_preference))=0;
                    proposal_most_preferred_j(proposal_most_preferred_j==chosen_preference)=0;
                    append_2=proposal_most_preferred_j(proposal_most_preferred_j~=0);
                    for u=1:size(append_2,2)
                         append_location=find_EhaD_location(append_2(u),new_D2D);
                         h=new_D2D(append_location);
                         new_D2D(new_D2D==h)=0;
                    end
                    unmatched_D2D_index=[unmatched_D2D_index append_2];
                    continue;
               else
                   continue;
               end
         end
     end
     D2D=D2D_origin(unmatched_D2D_index);
     new_D2D_preference=delete_most_preferred(preference_D2D_comparison);
     preference_D2D_comparison=new_D2D_preference;
end
end