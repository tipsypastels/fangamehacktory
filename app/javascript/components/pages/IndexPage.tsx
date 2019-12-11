/** @jsx jsx */
import { jsx } from '@emotion/core';
import Page from '../Page';
import { useApi, useQueryParams } from '../../utils/hooks';
import Subject from '../../types/Subject';
import SubjectListing from '../SubjectListing';
import IndexSidebar from '../sidebars/IndexSidebar';
import Outline from '../display/Outline';
import Font from '../display/Font';

type Response = {
  your_drafts: Subject[];
  timeline: Subject[];
}

export default function IndexPage() {
  const { type } = useQueryParams();
  const response = useApi<Response>(`/subjects`, { type });

  // TODO
  if (!response) {
    return null;
  }

  return (
    <Page sidebar={<IndexSidebar />}>
      {response.your_drafts.length && (
        <Outline color="draft">
          <Font face="h2" color="draft">
            Your Drafts
          </Font>

          {response.your_drafts.map(subject => (
            <SubjectListing key={subject.id} {...subject} />
          ))}
        </Outline>
      )}

      {response.timeline.map(subject => (
        <SubjectListing key={subject.id} {...subject} />
      ))}
    </Page>
  );
}