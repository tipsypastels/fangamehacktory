/** @jsx jsx */
import { jsx } from '@emotion/core';
import { useParams } from 'react-router';
import { useApi } from '../../utils/hooks';
import Page from '../Page';
import Subject from '../../types/Subject';
import Raw from '../Raw';
import SubjectInfobox from '../SubjectInfobox';
import Font from '../display/Font';
import { useState } from 'react';
import SubjectContent from '../SubjectContent';

export default function SubjectPage() {
  const { id } = useParams();
  const [mode, setMode] = useState<'view' | 'edit'>('view');
  
  const subject = useApi<Subject>(`/subjects/${id}`, {}, {}, subject => {
    if (subject.editable && subject.status === 'draft') {
      setMode('edit');
    }
  });

  // TODO
  if (!subject) {
    return null;
  }

  return (
    <Page paper footer={false}>
      <Font face="h1">{subject.title}</Font>
      <Raw html={subject.description} />
      <SubjectInfobox {...subject} />
      
      <SubjectContent 
        subject={subject}
        editing={mode === 'edit'}
      />
    </Page>
  );
}