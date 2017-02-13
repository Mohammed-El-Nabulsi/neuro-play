unit GetSetVariables;

interface

uses
  Windows, Messages, SysUtils, Dialogs;

type BaseClass = class

  private

  m_Alpha: double;
  m_Sum, m_Should, m_A: double;
  m_w0, m_w1, m_w2 : double;
  m_e1, m_e2: double;
  m_Times, m_curTime: integer;

  public

  function GetCurTime() : integer;
  procedure SetCurTime(curtime: integer );

  function GetTimes() : integer;
  procedure SetTimes(times: integer );

  function GetAlpha() : double;
  procedure SetAlpha(alpha: double );

  function GetSum() : double;
  procedure SetSum(sum: double );

  function GetShould() : double;
  procedure SetShould(should: double );

  function GetA() : double;
  procedure SetA(a: double );

  function GetW0() : double;
  procedure SetW0(w0: double );

  function GetW1() : double;
  procedure SetW1(w1: double );

  function GetW2() : double;
  procedure SetW2(w2: double );

  function GetE1() : double;
  procedure SetE1(e1: double );

  function GetE2() : double;
  procedure SetE2(e2: double );

  end;
var
  TBaseClass : BaseClass;



implementation

function BaseClass.GetCurTime() : integer; begin result := m_CurTime; end;
procedure BaseClass.SetCurTime(curtime: integer); begin m_CurTime := curtime; end;

function BaseClass.GetTimes() : integer; begin result := m_Times; end;
procedure BaseClass.SetTimes(times: integer); begin m_Times := times; end;

function BaseClass.GetAlpha() : double; begin result := m_Alpha; end;
procedure BaseClass.SetAlpha(alpha: double); begin m_Alpha := alpha; end;

function BaseClass.GetSum() : double; begin result := m_Sum; end;
procedure BaseClass.SetSum(sum: double); begin m_Sum := sum; end;

function BaseClass.GetShould() : double; begin result := m_Should; end;
procedure BaseClass.SetShould(should: double); begin m_Should := should; end;

function BaseClass.GetA() : double; begin result := m_A; end;
procedure BaseClass.SetA(a: double); begin m_A := a; end;

function BaseClass.GetW0() : double; begin result := m_w0; end;
procedure BaseClass.SetW0(w0: double); begin m_w0 := w0; end;

function BaseClass.GetW1() : double; begin result := m_w1; end;
procedure BaseClass.SetW1(w1: double); begin m_w1 := w1; end;

function BaseClass.GetW2() : double; begin result := m_w2; end;
procedure BaseClass.SetW2(w2: double); begin m_w2 := w2; end;

function BaseClass.GetE1() : double; begin result := m_e1; end;
procedure BaseClass.SetE1(e1: double); begin m_e1 := e1; end;

function BaseClass.GetE2() : double; begin result := m_e2; end;
procedure BaseClass.SetE2(e2: double); begin m_e2 := e2; end;

end.
