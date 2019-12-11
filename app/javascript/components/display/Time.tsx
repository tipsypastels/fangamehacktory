import React from 'react';
import moment from 'moment';
import Moment from 'react-moment';

const ONE_DAY = 1000 * 60 * 60 * 24;

export default function Time({ stamp }: { stamp: string | number }) {
  const date = moment(new Date(stamp));
  const today = moment(new Date());

  let format;
  if (today.diff(date) < ONE_DAY) {
    format = 'h:m A';
  } else if (date.get('year') === today.get('year')) {
    format = 'MMM D';
  } else {
    format = 'MMM D YYYY';
  }

  return (
    <Moment format={format}>
      {date}
    </Moment>
  )
}
