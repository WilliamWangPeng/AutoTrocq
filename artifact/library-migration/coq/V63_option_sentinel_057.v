(* V63 library-style representation-migration module *)
(* PATTERN: option-sentinel *)
(* TRANSFER_SHAPE: partial encoding *)
(* OBLIGATIONS: 3 *)

Module V63_option_sentinel_057.
Definition enc_57 (o : option nat) : nat :=
  match o with
  | None => 0
  | Some n => S n
  end.

Definition dec_57 (n : nat) : option nat :=
  match n with
  | 0 => None
  | S k => Some k
  end.

Definition size_57 (o : option nat) : nat :=
  match o with None => 0 | Some n => S n end.

Theorem dec_enc_57 : forall o : option nat, dec_57 (enc_57 o) = o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem size_transfer_57 : forall o : option nat, enc_57 o = size_57 o.
Proof.
  destruct o; reflexivity.
Qed.

Theorem none_unique_57 : forall o : option nat, enc_57 o = 0 -> o = None.
Proof.
  destruct o; simpl; congruence.
Qed.
End V63_option_sentinel_057.

