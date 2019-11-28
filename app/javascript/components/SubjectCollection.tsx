import React, { Fragment } from 'react'
import Subject from '../types/Subject'
import SubjectListing from './SubjectListing';

interface IProps {
  subjects: Subject[];
}

export default function SubjectCollection(props: IProps) {
  if (props.subjects.length === 0) {
    return null;
  }

  return (
    <div className="subject-collection">
      {props.subjects.map(subject => (
        <SubjectListing key={subject.id} {...subject} />
      ))}
    </div>
  );
}
