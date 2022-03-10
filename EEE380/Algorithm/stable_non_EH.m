function matched_partner=stable_non_EH(unmatched_CUE,InfD,D2D_preference,unmatched_CUE_preference)
matched_partner=containers.Map('KeyType','int32','ValueType','int32');
InfD_sub=InfD;
while size(InfD,2)>0
    most_preferred=show_most_preferred(D2D_preference);
    new_most_preferred=clean_most_preferred(most_preferred,InfD,InfD_sub);
    proposal=match_most_preferred_non_EH(new_most_preferred,InfD,InfD_sub,unmatched_CUE);
    for i=1:size(InfD,2)
       link=InfD(i);
       if link==0
           continue;
       end
       link_location=find_InfD_location(link,InfD_sub);
       preference_i=D2D_preference{link_location,2};
       most_preferred_i=preference_i(1);
       proposal_most_preferred_i=proposal(most_preferred_i);
       if size(proposal_most_preferred_i,2)>1
           continue;
       elseif size(proposal_most_preferred_i,2)==1
           matched_partner(link_location)=most_preferred_i;
           InfD(i)=0;
       end
   end
   new_InfD=InfD(InfD~=0);
   unmatched_InfD_index=[];
   for j=1:size(new_InfD,2)
       link=new_InfD(j);
       if link==0
           continue;
       end
       location_InfD_j=find_InfD_location(link,InfD_sub);
       preference_j=D2D_preference{location_InfD_j,2};
       most_preferred_j=preference_j(1);
       proposal_most_preferred_j=proposal(most_preferred_j);
       if size(proposal_most_preferred_j,2)==1
           continue;
       else
           umatched_CUE_preference_sub=unmatched_CUE_preference{most_preferred_j,2};
           index_more_preferred=unmatched_CUE_more_preferred(umatched_CUE_preference_sub,proposal_most_preferred_j);
               if size(index_more_preferred,2)>0
                   chosen_preference=umatched_CUE_preference_sub(index_more_preferred);
                   matched_partner(chosen_preference)=most_preferred_j;
                   new_InfD(new_InfD==InfD_sub(chosen_preference))=0;
                   proposal_most_preferred_j(proposal_most_preferred_j==chosen_preference)=0;
                   append_2=proposal_most_preferred_j(proposal_most_preferred_j~=0);
                   for u=1:size(append_2,2)
                       append_location=find_InfD_location(InfD_sub(append_2(u)),new_InfD);
                       h=new_InfD(append_location);
                       new_InfD(new_InfD==h)=0;
                   end
                   unmatched_InfD_index=[unmatched_InfD_index append_2];
                   continue;
               else
                   continue;
               end 
        end
   end
   InfD=InfD_sub(unmatched_InfD_index);
   new_D2D_preference=delete_most_preferred(D2D_preference);
   D2D_preference=new_D2D_preference;
end
end