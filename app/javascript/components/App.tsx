/** @jsx jsx */
import { jsx } from '@emotion/core';
import User from '../types/User';
import { useReducer, Dispatch, createContext } from 'react';
import { BrowserRouter as Router, Route, Switch } from "react-router-dom";
import IndexPage from './pages/IndexPage';
import { Subjected } from '../types/Subject';
import SubjectPage from './pages/SubjectPage';

export interface AppProps {
  currentUser: User;
  viewableTypes: Subjected[];
}

export interface AppState extends AppProps {
}

export type AppAction =
  | { type: 'SIGN_IN', user: User }
  | { type: 'SIGN_OUT' }

type AppContextProps = [AppState, Dispatch<AppAction>];
export const AppContext = createContext<Partial<AppContextProps>>([]);

function appReducer(state: AppState, action: AppAction): AppState {
  switch(action.type) {
    case 'SIGN_IN': {
      return { ...state, currentUser: action.user };
    }
    case 'SIGN_OUT': {
      return { ...state, currentUser: null };
    }
  }
}

export const FGH_ROUTES = {
  '/':    IndexPage,
  '/:id': SubjectPage,
}

export default function App(props: AppProps) {
  const [appState, appDispatch] = useReducer(appReducer, {
    ...props
  });

  return (
    <AppContext.Provider value={[appState, appDispatch]}>
      <Router>
        <Switch>
          {Object.keys(FGH_ROUTES).map(path => {
            const Component = FGH_ROUTES[path];

            return (
              <Route
                key={path}
                path={path}
                exact component={Component}
              />
            );
          })}
        </Switch>
      </Router>
    </AppContext.Provider>
  );
}