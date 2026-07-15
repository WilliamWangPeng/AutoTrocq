(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_035.
Definition enc_35 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_35 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_35 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_35 : forall o : option nat, dec_35 (enc_35 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_35 : forall o : option nat, enc_35 o = size_35 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_35 : forall o : option nat, enc_35 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_035.

