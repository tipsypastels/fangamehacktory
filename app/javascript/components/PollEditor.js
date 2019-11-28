import React, { useState, useRef } from 'react';

export default function PollEditor(props) {
  const [polls, setPolls] = useState(props.polls);
  const [deletedPolls, setDeletedPolls] = useState([]);
  const ref = useRef();

  function isPersisted(poll) {

  }

  function addPoll() {
    setPolls([{
      id: `local-${Math.random()}`,
      title: 'Untitled Poll',
      status: 1,
      options: [],
    }, ...polls]);
    
    ref.current.focus();
  }

  function setPollTitle(i) {
    return function(e) {
      const dupPolls = [...polls];
      dupPolls[i].title = e.target.value;
      setPolls(dupPolls);
    }
  }

  if (polls.length === 0) {
    return (
      <div>You don't have any polls. <span onClick={addPoll} className="link-color">Add one!</span></div>
    );
  }

  return (
    <form>
      <span onClick={addPoll} className="link-color">
        [New Poll]
      </span>

      {polls.map((poll, i) => (
        <section key={poll.id}>
          <label className="attr attr--text">
            <div className="attr__title">
              Poll Title:
            </div>

            <input
              type="text"
              value={poll.title}
              onChange={setPollTitle(i)}
              ref={i === 0 ? ref : undefined}
            />
          </label>
        </section>
      ))}
    </form>
  )  
}
