function [matched_partner]=stable(CUE,EhaD,Sid,D2D_preference,CUE_preference)

matched_partner=containers.Map('KeyType','int32','ValueType','int32');
EhaD_sub=EhaD;
while size(EhaD,2)>0
   EhaD
   most_preferred=show_most_preferred(D2D_preference)
   new_most_preferred=clean_most_preferred(most_preferred,EhaD,EhaD_sub)
   proposal=match_most_preferred(new_most_preferred,EhaD,EhaD_sub,CUE,Sid);
   %先将proposal 中只收到一个EhaD的proposal 匹配完
   for i=1:size(EhaD,2)
       link=EhaD(i);
       if link==0
           continue;
       end
       link_location=find_EhaD_location(link,EhaD);
       preference_i=D2D_preference{link_location,2};
       partner_selection_i=Sid{link_location,1};
       most_preferred_i=preference_i(1);
       most_preferred_i_coord=partner_selection_i(most_preferred_i,:);
       most_preferred_i_location=location_CUE(CUE,most_preferred_i_coord);
       proposal_most_preferred_i=proposal(most_preferred_i_location);
       if size(proposal_most_preferred_i,2)>1
           continue;
       elseif size(proposal_most_preferred_i,2)==1
           matched_partner(link_location)=most_preferred_i_location;
           EhaD(i)=0;
       end
   end
   keys(matched_partner)
   new_EhaD=EhaD(EhaD~=0)
   unmatched_EhaD_index=[];
   for j=1:size(new_EhaD,2)
       link=new_EhaD(j);
       if link==0
           continue;
       end
       location_EhaD_j=find_EhaD_location(link,EhaD);
       preference_j=D2D_preference{location_EhaD_j,2};
       partner_selection_j=Sid{location_EhaD_j,1};
       most_preferred_j=preference_j(1);
       most_preferred_j_coord=partner_selection_j(most_preferred_j,:);
       most_preferred_j_location=location_CUE(CUE,most_preferred_j_coord);
       proposal_most_preferred_j=proposal(most_preferred_j_location);
       if size(proposal_most_preferred_j,2)==1
           continue;
       elseif size(proposal_most_preferred_j,2)>1
           find_match=false;
           for n=1:size(proposal_most_preferred_j)
               preference_n=D2D_preference{proposal_most_preferred_j(n),2};
               if size(preference_n,2)==1
                   matched_partner(proposal_most_preferred_j(n))=most_preferred_j_location;
                   new_EhaD(new_EhaD==EhaD_sub(proposal_most_preferred_j(n)))=0;
                   find_match=true;
                   proposal_most_preferred_j(n)=0;
               end
           end
           if find_match==true
               if size(proposal_most_preferred_j(proposal_most_preferred_j~=0),2)==0
                   continue;
               else
                   append_1=proposal_most_preferred_j(proposal_most_preferred_j~=0);
                   for u=1:size(append_1,2)
                       append_location=find_EhaD_location(EhaD_sub(append_1(u)),new_EhaD);
                       h=new_EhaD(append_location);
                       new_EhaD(new_EhaD==h)=0;
                   end
                   unmatched_EhaD_index=[unmatched_EhaD_index append_1];
                   continue;
               end
           else
               CUE_preference_sub=CUE_preference{most_preferred_j_location,2};
               index_more_preferred=CUE_more_preferred(CUE_preference_sub,proposal_most_preferred_j);
               if size(index_more_preferred,2)>0
                   proposal_most_preferred_j
                   chosen_preference=CUE_preference_sub(index_more_preferred);
                   matched_partner(chosen_preference)=most_preferred_j_location;
                   new_EhaD(new_EhaD==EhaD_sub(chosen_preference))=0;
                   proposal_most_preferred_j(proposal_most_preferred_j==chosen_preference)=0;
                   append_2=proposal_most_preferred_j(proposal_most_preferred_j~=0);
                   for u=1:size(append_2,2)
                       append_location=find_EhaD_location(EhaD_sub(append_2(u)),new_EhaD);
                       h=new_EhaD(append_location);
                       new_EhaD(new_EhaD==h)=0;
                   end
                   unmatched_EhaD_index=[unmatched_EhaD_index append_2];
                   continue;
               else
                   continue;
               end 
           end
       end
   end
   keys(matched_partner)
   EhaD=EhaD(unmatched_EhaD_index);
   new_D2D_preference=delete_most_preferred(D2D_preference);
   D2D_preference=new_D2D_preference;
end
end