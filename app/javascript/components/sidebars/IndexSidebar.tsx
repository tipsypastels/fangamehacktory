/** @jsx jsx */
import { jsx } from '@emotion/core';
import { Fragment, useContext } from 'react';
import { SidebarAction } from '../Sidebar';
import { AppContext } from '../App';

export default function IndexSidebar() {
  const [{ viewableTypes }] = useContext(AppContext);

  return (
    <Fragment>
      <SidebarAction to="/" icon="home">
        Home
      </SidebarAction>

      <Fragment>
        {viewableTypes.map(s => (
          <SidebarAction 
            key={s.type} 
            icon={s.icon}
            color={s.css_class}
            to={`/?type=${s.type}`} 
          >
            {s.plural_human_name} 
          </SidebarAction>
        ))}
      </Fragment>

      <SidebarAction 
        to="https://discord.gg/8hNqE2V" 
        icon={['discord', 'fab']} 
        color="#6b89f0"
      >
        Discord
      </SidebarAction>
    </Fragment>
  );
}