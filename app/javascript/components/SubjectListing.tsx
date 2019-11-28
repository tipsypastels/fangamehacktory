import React from 'react'
import Subject from '../types/Subject'

export default function SubjectListing(subject: Subject) {
  return (
    <div className={`subject subject--${subject.cssClass}`}>
      <div className="subject__thumbnail" style={{
        backgroundImage: `url(${subject.thumbnailURL})`,
      }}>
        <a href={subject.path}>
          {subject.status === 'draft' ? (
            <span className="subject__thumbnail__draft">
              Draft
            </span>
          ) : ''}
        </a>
      </div>

      <div className="subject__content" style={{
        backgroundColor: subject.color,
      }}>
        <a href={subject.path}>
          <img 
            className="subject__avatar" 
            src={subject.avatarURL} 
          />
        </a>

        <div className="subject__info">
          <a className="subject__title" href={subject.path}>
            {subject.title}
          </a>

          <a href={subject.creatorPath}>
            {subject.creatorUsername}
          </a>
        </div>
      </div>
    </div>
  );
}
